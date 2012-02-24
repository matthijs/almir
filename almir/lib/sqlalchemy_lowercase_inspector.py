import string

from sqlalchemy.engine.reflection import Inspector


class LowerCaseInspector(Inspector):
    """Implements reflection inspector that reflects everything lowercase"""

    def get_table_names(self, *a, **kw):
        tables = super(LowerCaseInspector, self).get_table_names(*a, **kw)
        return map(string.lower, tables)

    def get_columns(self, *a, **kw):
        columns = super(LowerCaseInspector, self).get_columns(*a, **kw)

        def lower_case(column):
            column['name'] = column['name'].lower()
            return column

        print 'skipping column initialwrite since it gives trouble on sqlite (default as 0 while its datatime type)'
        columns = filter(lambda x: x['name'].lower() != 'initialwrite' ,columns)
        return map(lower_case, columns)

    def get_indexes(self, *a, **kw):
        columns = super(LowerCaseInspector, self).get_indexes(*a, **kw)

        def lower_case(column):
            column['name'] = column['name'].lower()
            column['column_names'] = map(string.lower, column['column_names'])
            return column

        return map(lower_case, columns)

    def get_foreign_keys(self, *a, **kw):
        columns = super(LowerCaseInspector, self).get_foreign_keys(*a, **kw)

        def lower_case(column):
            column['referred_table'] = column['referred_table'].lower()
            if column['name']:
                column['name'] = column['name'].lower()
            column['referred_columns'] = map(string.lower, column['referred_columns'])
            column['constrained_columns'] = map(string.lower, column['constrained_columns'])
            return column

        return map(lower_case, columns)

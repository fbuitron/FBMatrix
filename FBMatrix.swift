struct matrix <ElementType>
{
    typealias mRow = [ElementType?]
    var theMatrix : [mRow] = [mRow]()
    let rows : Int
    let columns : Int

    init(rows : Int, columns : Int)
    {
        self.rows = rows
        self.columns = columns
        initializeMatrix()

    }

    mutating private func initializeMatrix()
    {
        for (var i = 0; i < self.rows; i++)
        {
            var aRow : mRow = []
            for (var j = 0; j < self.columns; j++)
            {

                aRow.insert(nil, atIndex: j)
            }
            self.theMatrix.insert(aRow, atIndex: i)
        }
    }

    mutating func insert(value : ElementType, row : Int, column : Int) -> ElementType?
    {
        var aRow = theMatrix[row]
        aRow.insert(value, atIndex: column)
        theMatrix[row] = aRow
        return value
    }

    func itemAtRow(row : Int, column : Int) -> ElementType?
    {
        if let aValue = theMatrix[row][column]
        {
            return aValue
        }
        return nil
    }

    subscript (row : Int, column : Int) ->ElementType?
    {
        precondition(row < self.rows && column < self.columns, "Index Out Of Bounds")
        return itemAtRow(row,column : column)
    }
    subscript (row : Int) -> mRow
    {
        precondition(row < self.rows, "Index out of Bounds")
        return self.theMatrix[row]
    }


}

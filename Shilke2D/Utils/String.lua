---Extends string namespace

---Removes blank spaces at begin or end of the string
--@param s source string
--@return a new string
function string.trim(s)
  return (s:gsub("^%s*(.-)%s*$", "%1"))
end

---Checks if a string starts with a given substring
--@param s the string to check
--@param startString the prefix to check
--@return bool
function string.starts(s,startString)
   return string.sub(s,1,string.len(startString))==startString
end

---Checks if a string ends with a given substring
--@param s the string to check
--@param endString the suffix to check
--@return bool
function string.ends(s,endString)
   return string.sub(s,-string.len(endString))==endString
end


---Remove a prefix from a string
--@param s source string
--@param prefix the prefix to remove
--@return a new string
function string.removePrefix(s, prefix)
	if string.starts(s,prefix) then
		return string.sub(s,string.len(prefix)+1)
	end
	return s
end

---Remove a suffix from a string
--@param s source string
--@param suffix the suffix to remove
--@return a new string
function string.removeSuffix(s, suffix)
	if string.ends(s,suffix) then
		return string.sub(s,1,-string.len(suffix)-1)
	end
	return s
end

---Splits a string into multiple string based on a specific separator
--@param s the string to split
--@param re the separator char or pattern (as regular expression). 
--default is blank char
--@return a set of strings
function string.split(s,re)
    local i1 = 1
    local ls = {}
    local append = table.insert
    -- if no separator is provided, it uses spaces and return an array
    -- with all the words of "s"
    if not re then 
        re = '%s+' 
    end
    if re == '' then return {s} end
        while true do
            local i2,i3 = s:find(re,i1)
            if not i2 then
                local last = s:sub(i1)
                if last ~= '' then append(ls,last) end
                if #ls == 1 and ls[1] == '' then
                    return {}
                else
                    return ls
            end
        end
        append(ls,s:sub(i1,i2-1))
        i1 = i3+1
    end
end

---given an absolute file path it returns path, filename and extension
--@param path absolute file path
--@return path
--@return filename
--@return extension
function string.splitPath(path)
	return string.match(path, "(.-)([^\\]-)%.([^%.]+)$")
end

---Returns the extension given a filename
--@param path the absolute path of a file, or just the fileName
--@return file extension
function string.getFileExtension(path)
	return string.match(path, "([^%.]+)$")
end

---Returns the dir of a given filename
--@param path the absolute path of a file
--@return the path to the file
function string.getFileDir(path)
	return string.match(path, "(.-)[^\\/]-[^%.]+$")
end

---Returns the filename given an absolute path
--@param path the absolute path of a file
--@param withExtension boolean, if false or nil returns fileName without extension
--@return fileName
function string.getFileName(path,withExtension)
	if withExtension then
		return string.match(path, "([^\\/]-[^%.]+)$")
	else
		return string.match(path, "([^\\/]+)%..*$")
	end
end

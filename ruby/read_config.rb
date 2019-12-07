require 'json'
require 'csv'


hostlist=ARGV[0]
hosts=ARGV[1]


def file_read_csv_tsv(filename, type)
  if type == 'csv' then
    csv = CSV.read("#{filename}" , headers: false)
    return csv
  elsif type == 'tsv' then
    tsv = CSV.read("#{filename}" , col_sep: "\t", headers: false)
    return tsv
  end
end

def csv_to_hash(csv)
  hash = {}
  csv.to_h.each do |key, value|
    hash.store(key, value)
  end
  return hash
end

def hash_conbine(csv_hash,tsv_hash)
  hash_IP = Hash.new { |h,k| h[k] = {} }
  csv_hash.each do |key, value|
    if tsv_hash["#{key}"] != nil then
      hash_IP["#{value}"]["#{key}"] = tsv_hash["#{key}"]
    else
      puts "NG #{key}"
    end
  end
  if hash_IP.nil? then
    puts "csv tsv conbime failed. Return Nil"
    return nil
  end
  return hash_IP
end
csv = file_read_csv_tsv(hostlist,'csv')
tsv = file_read_csv_tsv(hosts,'tsv')


csv_hash = csv_to_hash(csv)
tsv_hash = csv_to_hash(tsv)


  

a = hash_conbine(csv_hash,tsv_hash)
puts a.class



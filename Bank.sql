---------------------------------------------------------------------------------------------------
-- drop tables
DROP TABLE IF EXISTS Trn_Src_Des;

DROP TABLE IF EXISTS Branch;

DROP TABLE IF EXISTS Deposit;

DROP TABLE IF EXISTS Customer CASCADE;

DROP TABLE IF EXISTS Deposit_Type;

DROP TABLE IF EXISTS Deposit_Status;

DROP TABLE IF EXISTS Branch;

DROP TABLE IF EXISTS TR1;

DROP TABLE IF EXISTS TR2;

---------------------------------------------------------------------------------------------------
CREATE TABLE Customer (
	CID int,
	Name varchar(50) NOT NULL,
	NatCod varchar(10) NOT NULL,
	Birthdate Date NOT NULL,
	ADD
		varchar(50) NOT NULL,
		Tel varchar(20) NOT NULL,
		PRIMARY KEY(CID)
);

CREATE TABLE Branch (
	Branch_ID int NOT NULL,
	Branch_Name varchar(50) NOT NULL,
	Branch_Add varchar(50) NOT NULL,
	Branch_Tel varchar(20) NOT NULL,
	PRIMARY KEY(Branch_ID)
);

CREATE TABLE Trn_Src_Des (
	VoucherId varchar(10),
	TrnDate Date NOT NULL,
	TrnTime varchar(6) NOT NULL,
	Amount bigint NOT NULL,
	SourceDep int,
	DesDep int,
	Branch_ID int NOT NULL,
	Trn_Desc varchar(50),
	PRIMARY KEY(VoucherID),
	FOREIGN KEY (Branch_ID) REFERENCES Branch (Branch_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Deposit_Type (
	Dep_Type int NOT NULL,
	Dep_Type_Desc varchar(50),
	PRIMARY KEY(Dep_Type)
);

CREATE TABLE Deposit (
	Dep_ID int,
	Dep_Type int NOT NULL,
	CID int NOT NULL,
	OpenDate Date NOT NULL,
	STATUS int NOT NULL,
	PRIMARY KEY (Dep_ID),
	FOREIGN KEY (CID) REFERENCES Customer (CID) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (Dep_Type) REFERENCES Deposit_Type (Dep_Type) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Deposit_Status (STATUS int NOT NULL, Status_Desc varchar(50));

-- temporal tables just for saving some data in part 2
CREATE TABLE TR1 (
	VoucherId varchar(10),
	sender int,
	receiver int
);

CREATE TABLE TR2 (
	VoucherId varchar(10),
	sender int,
	receiver int
);

---------------------------------------------------------------------------------------------------
-- intialize tables with new data
INSERT INTO
	Branch
VALUES
	(1, 'Meli', 'Isfahan', '03136258478');

---------------------------------------------------------------------------------------------------
INSERT INTO
	Deposit_Type
VALUES
(1, 'Golden deposit');

---------------------------------------------------------------------------------------------------
INSERT INTO
	customer
VALUES
	(
		1,
		'yasin',
		'1273757475',
		'2001-7-27',
		'Isfahan',
		'09134267171'
	);

INSERT INTO
	customer
VALUES
	(
		2,
		'mohammad',
		'1273757476',
		'2001-7-27',
		'Isfahan',
		'09134267171'
	);

INSERT INTO
	customer
VALUES
	(
		3,
		'ahmad',
		'9999999999',
		'2001-7-27',
		'Isfahan',
		'09134267171'
	);

INSERT INTO
	customer
VALUES
	(
		4,
		'reza',
		'1273757445',
		'2001-7-27',
		'Isfahan',
		'09134267171'
	);

INSERT INTO
	customer
VALUES
	(
		5,
		'majid',
		'1273757440',
		'2001-7-27',
		'Isfahan',
		'09134267171'
	);

INSERT INTO
	customer
VALUES
	(
		6,
		'ali',
		'1273757539',
		'2001-7-27',
		'Isfahan',
		'09134267171'
	);

INSERT INTO
	customer
VALUES
	(
		7,
		'hamid',
		'1273757531',
		'2001-7-27',
		'Isfahan',
		'09134267171'
	);

INSERT INTO
	customer
VALUES
	(
		8,
		'pouya',
		'1273857539',
		'2001-7-27',
		'Isfahan',
		'09134267171'
	);

INSERT INTO
	customer
VALUES
	(
		9,
		'akbar',
		'1273717531',
		'2001-7-27',
		'Isfahan',
		'09134267171'
	);

INSERT INTO
	customer
VALUES
	(
		10,
		'asghar',
		'1274856539',
		'2001-7-27',
		'Isfahan',
		'09134267171'
	);

INSERT INTO
	customer
VALUES
	(
		11,
		'javad',
		'1283717531',
		'2001-7-27',
		'Isfahan',
		'09134267171'
	);

---------------------------------------------------------------------------------------------------
INSERT INTO
	deposit
VALUES
	(1, 1, 1, '2005-12-12', 1);

INSERT INTO
	deposit
VALUES
	(2, 1, 2, '2005-12-12', 1);

INSERT INTO
	deposit
VALUES
	(3, 1, 3, '2005-12-12', 1);

INSERT INTO
	deposit
VALUES
	(4, 1, 4, '2005-12-12', 1);

INSERT INTO
	deposit
VALUES
	(5, 1, 5, '2005-12-12', 1);

INSERT INTO
	deposit
VALUES
	(6, 1, 6, '2005-12-12', 1);

INSERT INTO
	deposit
VALUES
	(7, 1, 7, '2005-12-12', 1);

INSERT INTO
	deposit
VALUES
	(8, 1, 8, '2005-12-12', 1);

INSERT INTO
	deposit
VALUES
	(9, 1, 9, '2005-12-12', 1);

---------------------------------------------------------------------------------------------------
INSERT INTO
	Trn_Src_Des
VALUES
	(
		1,
		'2008-11-01',
		'100101',
		19,
		165,
		1,
		1,
		'transfered'
	);

INSERT INTO
	Trn_Src_Des
VALUES
	(
		2,
		'2008-12-01',
		'100101',
		20,
		1,
		3,
		1,
		'transfered'
	);

INSERT INTO
	Trn_Src_Des
VALUES
	(
		3,
		'2008-12-11',
		'100101',
		20,
		NULL,
		3,
		1,
		'transfered'
	);

INSERT INTO
	Trn_Src_Des
VALUES
	(
		4,
		'2008-12-20',
		'100101',
		65,
		NULL,
		2,
		1,
		'transfered'
	);

INSERT INTO
	Trn_Src_Des
VALUES
	(
		5,
		'2008-12-21',
		'100101',
		60,
		2,
		3,
		1,
		'transfered'
	);

INSERT INTO
	Trn_Src_Des
VALUES
	(
		6,
		'2009-01-01',
		'110101',
		100,
		3,
		4,
		1,
		'transfered'
	);

INSERT INTO
	Trn_Src_Des
VALUES
	(
		7,
		'2009-01-02',
		'110101',
		100,
		4,
		5,
		1,
		'transfered'
	);

INSERT INTO
	Trn_Src_Des
VALUES
	(
		8,
		'2009-01-02',
		'110102',
		40,
		4,
		6,
		1,
		'transfered'
	);

INSERT INTO
	Trn_Src_Des
VALUES
	(
		9,
		'2009-01-02',
		'110103',
		50,
		4,
		8,
		1,
		'transfered'
	);

INSERT INTO
	Trn_Src_Des
VALUES
	(
		10,
		'2009-01-03',
		'110101',
		20,
		4,
		7,
		1,
		'transfered'
	);

INSERT INTO
	Trn_Src_Des
VALUES
	(
		11,
		'2009-01-03',
		'110101',
		30,
		8,
		9,
		1,
		'transfered'
	);

INSERT INTO
	Trn_Src_Des
VALUES
	(
		12,
		'2009-01-03',
		'110102',
		25,
		8,
		120,
		1,
		'transfered'
	);

INSERT INTO
	Trn_Src_Des
VALUES
	(
		13,
		'2009-01-04',
		'110101',
		30,
		9,
		NULL,
		1,
		'transfered'
	);

INSERT INTO
	Trn_Src_Des
VALUES
	(
		14,
		'2009-01-03',
		'110102',
		40,
		4,
		10,
		1,
		'transfered'
	);

INSERT INTO
	Trn_Src_Des
VALUES
	(
		15,
		'2009-01-03',
		'110103',
		100,
		4,
		11,
		1,
		'transfered'
	);

---------------------------------------------------------------------------------------------------
---------------------------------------Part 1------------------------------------------------------
---------------------------------------------------------------------------------------------------
DROP VIEW IF EXISTS customer_with_national_code_validation;

-- Check is this natioanl code valide or not
CREATE VIEW customer_with_national_code_validation AS
SELECT
	c.CID,
	c.Name,
	c.NatCod,
	c.Birthdate,
	c.add,
	c.Tel,
	(
		CASE
			WHEN (
				CASE
					WHEN length(natcod) = 10 THEN substring(c.natcod, 1, 1) :: int * 10 + substring(c.natcod, 2, 1) :: int * 9 + substring(c.natcod, 3, 1) :: int * 8 + substring(c.natcod, 4, 1) :: int * 7 + substring(c.natcod, 5, 1) :: int * 6 + substring(c.natcod, 6, 1) :: int * 5 + substring(c.natcod, 7, 1) :: int * 4 + substring(c.natcod, 8, 1) :: int * 3 + substring(c.natcod, 9, 1) :: int * 2
					WHEN length(natcod) = 9 THEN substring(c.natcod, 1, 1) :: int * 9 + substring(c.natcod, 2, 1) :: int * 8 + substring(c.natcod, 3, 1) :: int * 7 + substring(c.natcod, 4, 1) :: int * 6 + substring(c.natcod, 5, 1) :: int * 5 + substring(c.natcod, 6, 1) :: int * 4 + substring(c.natcod, 7, 1) :: int * 3 + substring(c.natcod, 8, 1) :: int * 2
					WHEN length(natcod) = 8 THEN substring(c.natcod, 1, 1) :: int * 8 + substring(c.natcod, 2, 1) :: int * 7 + substring(c.natcod, 3, 1) :: int * 6 + substring(c.natcod, 4, 1) :: int * 5 + substring(c.natcod, 5, 1) :: int * 4 + substring(c.natcod, 6, 1) :: int * 3 + substring(c.natcod, 7, 1) :: int * 2
				END
			) % 11 < 2 THEN (
				CASE
					WHEN length(natcod) = 10 THEN substring(c.natcod, 1, 1) :: int * 10 + substring(c.natcod, 2, 1) :: int * 9 + substring(c.natcod, 3, 1) :: int * 8 + substring(c.natcod, 4, 1) :: int * 7 + substring(c.natcod, 5, 1) :: int * 6 + substring(c.natcod, 6, 1) :: int * 5 + substring(c.natcod, 7, 1) :: int * 4 + substring(c.natcod, 8, 1) :: int * 3 + substring(c.natcod, 9, 1) :: int * 2
					WHEN length(natcod) = 9 THEN substring(c.natcod, 1, 1) :: int * 9 + substring(c.natcod, 2, 1) :: int * 8 + substring(c.natcod, 3, 1) :: int * 7 + substring(c.natcod, 4, 1) :: int * 6 + substring(c.natcod, 5, 1) :: int * 5 + substring(c.natcod, 6, 1) :: int * 4 + substring(c.natcod, 7, 1) :: int * 3 + substring(c.natcod, 8, 1) :: int * 2
					WHEN length(natcod) = 8 THEN substring(c.natcod, 1, 1) :: int * 8 + substring(c.natcod, 2, 1) :: int * 7 + substring(c.natcod, 3, 1) :: int * 6 + substring(c.natcod, 4, 1) :: int * 5 + substring(c.natcod, 5, 1) :: int * 4 + substring(c.natcod, 6, 1) :: int * 3 + substring(c.natcod, 7, 1) :: int * 2
				END
			) % 11 = substring(c.natcod, length(c.natcod), 1) :: int
			ELSE 11 - (
				CASE
					WHEN length(natcod) = 10 THEN substring(c.natcod, 1, 1) :: int * 10 + substring(c.natcod, 2, 1) :: int * 9 + substring(c.natcod, 3, 1) :: int * 8 + substring(c.natcod, 4, 1) :: int * 7 + substring(c.natcod, 5, 1) :: int * 6 + substring(c.natcod, 6, 1) :: int * 5 + substring(c.natcod, 7, 1) :: int * 4 + substring(c.natcod, 8, 1) :: int * 3 + substring(c.natcod, 9, 1) :: int * 2
					WHEN length(natcod) = 9 THEN substring(c.natcod, 1, 1) :: int * 9 + substring(c.natcod, 2, 1) :: int * 8 + substring(c.natcod, 3, 1) :: int * 7 + substring(c.natcod, 4, 1) :: int * 6 + substring(c.natcod, 5, 1) :: int * 5 + substring(c.natcod, 6, 1) :: int * 4 + substring(c.natcod, 7, 1) :: int * 3 + substring(c.natcod, 8, 1) :: int * 2
					WHEN length(natcod) = 8 THEN substring(c.natcod, 1, 1) :: int * 8 + substring(c.natcod, 2, 1) :: int * 7 + substring(c.natcod, 3, 1) :: int * 6 + substring(c.natcod, 4, 1) :: int * 5 + substring(c.natcod, 5, 1) :: int * 4 + substring(c.natcod, 6, 1) :: int * 3 + substring(c.natcod, 7, 1) :: int * 2
				END
			) % 11 = substring(c.natcod, length(c.natcod), 1) :: int
		END
	) :: int AS Is_Valid
FROM
	customer c;

-- Test
SELECT
	*
FROM
	customer_with_national_code_validation;

---------------------------------------------------------------------------------------------------
---------------------------------------Part 2------------------------------------------------------
---------------------------------------------------------------------------------------------------
DROP FUNCTION IF EXISTS transaction_details;

-- Return all data about a transaction
CREATE 
OR REPLACE FUNCTION transaction_details(voucher_id varchar(10)) RETURNS TABLE(
	VoucherId varchar(10),
	TrnDate Date,
	TrnTime varchar(6),
	Amount bigint,
	SourceDep int,
	DesDep int,
	Branch_ID int,
	Trn_Desc varchar(50)
) AS $$ BEGIN RETURN query (
	SELECT
		*
	FROM
		Trn_Src_Des t
	WHERE
		t.voucherid = voucher_id
);

END;

$$ LANGUAGE 'plpgsql';

-- Test
SELECT
	*
FROM
	transaction_details('6');

---------------------------------------------------------------------------------------------------
DROP FUNCTION IF EXISTS transaction_sender_foot_print;

-- Show all money flows, that sender may came this money from
CREATE
OR REPLACE FUNCTION transaction_sender_foot_print(voucher_id varchar(10)) RETURNS TABLE(trans_id varchar(10)) AS $$ declare sender int;

BEGIN sender := (
	SELECT
		t1.sourcedep
	FROM
		Trn_Src_Des t1
	WHERE
		t1.voucherid = voucher_id
);

RETURN query (
	SELECT
		t.voucherid
	FROM
		Trn_Src_Des t
	WHERE
		t.desdep = sender
		AND t.trndate < (
			SELECT
				t1.trndate
			FROM
				Trn_Src_Des t1
			WHERE
				t1.voucherid = voucher_id
		)
)
UNION
(
	SELECT
		transaction_sender_foot_print(t2.voucherid)
	FROM
		Trn_Src_Des t2
	WHERE
		t2.desdep = sender
		AND t2.sourcedep IN (
			SELECT
				d.dep_id
			FROM
				deposit d
		)
);

END;

$$ LANGUAGE 'plpgsql';

-- Test
SELECT
	*
FROM
	transaction_sender_foot_print('13');

---------------------------------------------------------------------------------------------------
DROP FUNCTION IF EXISTS transaction_receiver_foot_print;

-- Show all money flows, that receiver may spend money
CREATE
OR REPLACE FUNCTION transaction_receiver_foot_print(voucher_id varchar(10)) RETURNS TABLE(trans_id varchar(10)) AS $$ declare receiver int;

BEGIN receiver := (
	SELECT
		t1.desdep
	FROM
		Trn_Src_Des t1
	WHERE
		t1.voucherid = voucher_id
);

RETURN query (
	SELECT
		t.voucherid
	FROM
		Trn_Src_Des t
	WHERE
		t.sourcedep = receiver
		AND t.trndate > (
			SELECT
				t1.trndate
			FROM
				Trn_Src_Des t1
			WHERE
				t1.voucherid = voucher_id
		)
)
UNION
(
	SELECT
		transaction_receiver_foot_print(t2.voucherid)
	FROM
		Trn_Src_Des t2
	WHERE
		t2.sourcedep = receiver
		AND t2.desdep IN (
			SELECT
				d.dep_id
			FROM
				deposit d
		)
);

END;

$$ LANGUAGE 'plpgsql';

-- Test
SELECT
	*
FROM
	transaction_receiver_foot_print('5');

---------------------------------------------------------------------------------------------------
DROP FUNCTION IF EXISTS transaction_receiver_final_foot_print;

-- Show receiver transaction tree under our conditions
CREATE
OR REPLACE FUNCTION transaction_receiver_final_foot_print(voucher_id varchar(10)) RETURNS TABLE(id varchar(10), sender int, receiver int) AS $$ declare next_date date;

_amount bigint;

sum_all bigint;

pointer record;

receiver_id int;

BEGIN receiver_id = (
	SELECT
		td1.desdep
	FROM
		Trn_Src_Des td1
	WHERE
		td1.voucherid = voucher_id
);

next_date = (
	SELECT
		min(ts.trndate)
	FROM
		transaction_receiver_foot_print(voucher_id) tr,
		Trn_Src_Des ts
	WHERE
		tr.trans_id = ts.voucherid
		AND ts.sourcedep = receiver_id
);

_amount = (
	SELECT
		td.amount
	FROM
		Trn_Src_Des td
	WHERE
		td.voucherid = voucher_id
);

sum_all = 0;

-- First condition
FOR pointer IN (
	SELECT
		td2.voucherid,
		td2.sourcedep,
		td2.desdep,
		td2.amount
	FROM
		Trn_Src_Des td2
	WHERE
		td2.amount = _amount
		AND td2.trndate = next_date
		AND td2.sourcedep = receiver_id
) loop
INSERT INTO
	TR1
VALUES
	(
		pointer.voucherid,
		pointer.sourcedep,
		pointer.desdep
	);

END loop;

-- Second condition
FOR pointer IN (
	SELECT
		td2.voucherid,
		td2.sourcedep,
		td2.desdep,
		td2.amount
	FROM
		Trn_Src_Des td2
	WHERE
		td2.amount <> _amount
		AND td2.trndate = next_date
		AND td2.sourcedep = receiver_id
) loop sum_all = sum_all + pointer.amount;

INSERT INTO
	TR1
VALUES
	(
		pointer.voucherid,
		pointer.sourcedep,
		pointer.desdep
	);

END loop;

-- Third condition
<< looop >> BEGIN FOR pointer IN (
	SELECT
		td2.voucherid,
		td2.sourcedep,
		td2.desdep,
		td2.amount
	FROM
		Trn_Src_Des td2
	WHERE
		td2.trndate > next_date
		AND td2.sourcedep = receiver_id
	ORDER BY
		td2.trndate ASC
) loop IF sum_all + pointer.amount <= _amount THEN sum_all = sum_all + pointer.amount;

INSERT INTO
	TR1
VALUES
	(
		pointer.voucherid,
		pointer.sourcedep,
		pointer.desdep
	);

elsif sum_all + pointer.amount <= _amount * 1.1 THEN sum_all = sum_all + pointer.amount;

INSERT INTO
	TR1
VALUES
	(
		pointer.voucherid,
		pointer.sourcedep,
		pointer.desdep
	);

exit looop;

ELSE exit looop;

END IF;

END loop;

END;

RETURN query (
	SELECT
		tr.voucherid,
		tr.sender,
		tr.receiver
	FROM
		TR1 AS tr
)
UNION
(
	SELECT
		tk.id,
		tk.sender,
		tk.receiver
	FROM
		(
			SELECT
				(
					transaction_receiver_final_foot_print(t2.voucherid)
				).*
			FROM
				tr1 AS t2
			WHERE
				t2.sender = receiver_id
		) AS tk
);

END;

$$ LANGUAGE 'plpgsql';

-- Test
DELETE FROM
	tr1;

SELECT
	*
FROM
	transaction_receiver_final_foot_print('6');

---------------------------------------------------------------------------------------------------
DROP FUNCTION IF EXISTS transaction_sender_final_foot_print;

-- Show sender transaction tree under our conditions
CREATE
OR REPLACE FUNCTION transaction_sender_final_foot_print(voucher_id varchar(10)) RETURNS TABLE(id varchar(10), sender int, receiver int) AS $$ declare previous_date date;

_amount bigint;

sum_all bigint;

pointer record;

sender_id int;

BEGIN sender_id = (
	SELECT
		td1.sourcedep
	FROM
		Trn_Src_Des td1
	WHERE
		td1.voucherid = voucher_id
);

previous_date = (
	SELECT
		max(ts.trndate)
	FROM
		transaction_sender_foot_print(voucher_id) tr,
		Trn_Src_Des ts
	WHERE
		tr.trans_id = ts.voucherid
		AND ts.desdep = sender_id
);

_amount = (
	SELECT
		td.amount
	FROM
		Trn_Src_Des td
	WHERE
		td.voucherid = voucher_id
);

sum_all = 0;

-- First condition
FOR pointer IN (
	SELECT
		td2.voucherid,
		td2.sourcedep,
		td2.desdep,
		td2.amount
	FROM
		Trn_Src_Des td2
	WHERE
		td2.amount = _amount
		AND td2.trndate = previous_date
		AND td2.desdep = sender_id
) loop
INSERT INTO
	TR2
VALUES
	(
		pointer.voucherid,
		pointer.sourcedep,
		pointer.desdep
	);

END loop;

-- Second condition
FOR pointer IN (
	SELECT
		td2.voucherid,
		td2.sourcedep,
		td2.desdep,
		td2.amount
	FROM
		Trn_Src_Des td2
	WHERE
		td2.amount <> _amount
		AND td2.trndate = previous_date
		AND td2.desdep = sender_id
) loop sum_all = sum_all + pointer.amount;

INSERT INTO
	TR2
VALUES
	(
		pointer.voucherid,
		pointer.sourcedep,
		pointer.desdep
	);

END loop;

-- Third condition
<< looop >> BEGIN FOR pointer IN (
	SELECT
		td2.voucherid,
		td2.sourcedep,
		td2.desdep,
		td2.amount
	FROM
		Trn_Src_Des td2
	WHERE
		td2.trndate < previous_date
		AND td2.desdep = sender_id
	ORDER BY
		td2.trndate DESC
) loop IF sum_all + pointer.amount <= _amount THEN sum_all = sum_all + pointer.amount;

INSERT INTO
	TR2
VALUES
	(
		pointer.voucherid,
		pointer.sourcedep,
		pointer.desdep
	);

elsif sum_all + pointer.amount <= _amount * 1.1 THEN sum_all = sum_all + pointer.amount;

INSERT INTO
	TR2
VALUES
	(
		pointer.voucherid,
		pointer.sourcedep,
		pointer.desdep
	);

exit looop;

ELSE exit looop;

END IF;

END loop;

END;

RETURN query (
	SELECT
		tr.voucherid,
		tr.sender,
		tr.receiver
	FROM
		TR2 AS tr
)
UNION
(
	SELECT
		tk.id,
		tk.sender,
		tk.receiver
	FROM
		(
			SELECT
				(
					transaction_sender_final_foot_print(t2.voucherid)
				).*
			FROM
				tr2 AS t2
			WHERE
				t2.receiver = sender_id
		) AS tk
);

END;

$$ LANGUAGE 'plpgsql';

-- Test
DELETE FROM
	tr2;

SELECT
	*
FROM
	transaction_sender_final_foot_print('6');

---------------------------------------------------------------------------------------------------
DROP FUNCTION IF EXISTS transaction_final_foot_print;

CREATE
OR REPLACE FUNCTION transaction_final_foot_print(voucher_id varchar(10)) RETURNS TABLE(id varchar(10), sender int, receiver int) AS $$ BEGIN
DELETE FROM
	tr1;

DELETE FROM
	tr2;

RETURN query (
	(
		SELECT
			ts.voucherid,
			ts.sourcedep,
			ts.desdep
		FROM
			Trn_Src_Des AS ts
		WHERE
			ts.voucherid = voucher_id
	)
	UNION
	(
		SELECT
			tk.id,
			tk.sender,
			tk.receiver
		FROM
			(
				SELECT
					(transaction_sender_final_foot_print(voucher_id)).*
			) AS tk
	)
)
UNION
(
	SELECT
		tk.id,
		tk.sender,
		tk.receiver
	FROM
		(
			SELECT
				(
					transaction_receiver_final_foot_print(voucher_id)
				).* AS tk
		) AS tk
);

END;

$$ LANGUAGE 'plpgsql';

-- Test
SELECT
	*
FROM
	transaction_final_foot_print('6');

---------------------------------------------------------------------------------------------------
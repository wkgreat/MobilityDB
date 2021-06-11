﻿-------------------------------------------------------------------------------
-- Input
-------------------------------------------------------------------------------

SELECT npoint 'npoint(1,0.5)';
SELECT npoint ' npoint   (   1   ,	0.5   )   ';
/* Errors */
SELECT npoint 'point(1,0.5)';
SELECT npoint 'npoint(1,0.5';
SELECT npoint 'npoint(1 0.5)';
SELECT npoint 'npoint(1000,0.5)';
SELECT npoint 'npoint(1,1.5)';

SELECT nsegment 'nsegment(1,0.5,0.7)';
SELECT nsegment '  nsegment  (  1  ,  0.5  ,  0.7 ) ';
/* Errors */
SELECT nsegment 'segment(1,0.5,0.7)';
SELECT nsegment 'nsegment(1,0.5,0.7';
SELECT nsegment 'nsegment(1 0.5 0.7)';
SELECT nsegment 'nsegment(1000,0.5,0.7)';
SELECT nsegment 'nsegment(1,1.5,0.7)';

-------------------------------------------------------------------------------
-- Constructors
-------------------------------------------------------------------------------

SELECT npoint(1, 0.5);
/* Errors */
SELECT npoint(1000,0.5);
SELECT npoint(1,1.5);

SELECT nsegment(1, 0.2, 0.6);
SELECT nsegment(1);
SELECT nsegment(1, 0.2);
SELECT nsegment(npoint(1, 0.5));
/* Errors */
SELECT nsegment(1000,0.5,0.7);
SELECT nsegment(1,1.5,0.7);

-------------------------------------------------------------------------------
-- Accessing values
-------------------------------------------------------------------------------

SELECT route(npoint 'npoint(1,0.5)');
SELECT getPosition(npoint 'npoint(1,0.5)');
SELECT srid(npoint 'npoint(1,0.5)');

SELECT route(nsegment 'nsegment(1,0.5,0.7)');
SELECT startPosition(nsegment 'nsegment(1,0.5,0.7)');
SELECT endPosition(nsegment 'nsegment(1,0.5,0.7)');
SELECT srid(nsegment 'nsegment(1,0.5,0.7)');

-------------------------------------------------------------------------------
-- Modification functions
-------------------------------------------------------------------------------

SELECT setPrecision(npoint 'NPoint(1, 0.123456789)', 6);
SELECT setPrecision(nsegment 'NSegment(1, 0.123456789, 0.223456789)', 6);

-------------------------------------------------------------------------------
-- Cast functions between network and space
-------------------------------------------------------------------------------

SELECT st_astext(npoint 'npoint(1,0.2)'::geometry);

SELECT st_astext(nsegment 'nsegment(1,0.5,0.7)'::geometry);

SELECT setPrecision((npoint 'npoint(1,0.2)'::geometry)::npoint, 6);

SELECT setPrecision((nsegment 'nsegment(1,0.5,0.7)'::geometry)::nsegment, 6);
SELECT setPrecision((nsegment 'nsegment(1,0.5,0.5)'::geometry)::nsegment, 6);

SELECT geometry 'SRID=5676;Point(610.455019399524 528.508247341961)'::npoint;

SELECT geometry 'SRID=5676;LINESTRING(83.2832009065896 86.0903322231025,69.0807154867798 81.2081503681839,13.625699095428 97.5346013903618)'::nsegment;
-- NULL
SELECT geometry 'SRID=5676;LINESTRING(416.346567736997 528.335344322874,610.455019399524 528.508247341961,476.989195102204 642.550969672973)'::nsegment;
/* Errors */
SELECT geometry 'Polygon((0 0,0 1,1 1,1 0,0 0))'::nsegment;

-------------------------------------------------------------------------------
-- Comparisons
-------------------------------------------------------------------------------

SELECT npoint 'npoint(1,0.5)' = npoint 'npoint(1,0.5)';
SELECT npoint 'npoint(1,0.5)' = npoint 'npoint(1,0.7)';
SELECT npoint 'npoint(1,0.5)' = npoint 'npoint(2,0.5)';

SELECT npoint 'npoint(1,0.5)' != npoint 'npoint(1,0.5)';
SELECT npoint 'npoint(1,0.5)' != npoint 'npoint(1,0.7)';
SELECT npoint 'npoint(1,0.5)' != npoint 'npoint(2,0.5)';

SELECT npoint 'npoint(1,0.5)' < npoint 'npoint(1,0.5)';
SELECT npoint 'npoint(1,0.5)' < npoint 'npoint(1,0.7)';
SELECT npoint 'npoint(1,0.5)' < npoint 'npoint(2,0.5)';

SELECT npoint 'npoint(1,0.5)' <= npoint 'npoint(1,0.5)';
SELECT npoint 'npoint(1,0.5)' <= npoint 'npoint(1,0.7)';
SELECT npoint 'npoint(1,0.5)' <= npoint 'npoint(2,0.5)';

SELECT npoint 'npoint(1,0.5)' > npoint 'npoint(1,0.5)';
SELECT npoint 'npoint(1,0.5)' > npoint 'npoint(1,0.7)';
SELECT npoint 'npoint(1,0.5)' > npoint 'npoint(2,0.5)';

SELECT npoint 'npoint(1,0.5)' >= npoint 'npoint(1,0.5)';
SELECT npoint 'npoint(1,0.5)' >= npoint 'npoint(1,0.7)';
SELECT npoint 'npoint(1,0.5)' >= npoint 'npoint(2,0.5)';

SELECT nsegment_cmp(nsegment 'nsegment(1,0.3,0.5)', nsegment 'nsegment(1,0.3,0.4)');


SELECT nsegment 'nsegment(1,0.3,0.5)' = nsegment 'nsegment(1,0.3,0.5)';
SELECT nsegment 'nsegment(1,0.3,0.5)' = nsegment 'nsegment(1,0.3,0.7)';
SELECT nsegment 'nsegment(1,0.3,0.5)' = nsegment 'nsegment(1,0.5,0.7)';
SELECT nsegment 'nsegment(1,0.3,0.5)' = nsegment 'nsegment(2,0.3,0.5)';

SELECT nsegment 'nsegment(1,0.3,0.5)' != nsegment 'nsegment(1,0.3,0.5)';
SELECT nsegment 'nsegment(1,0.3,0.5)' != nsegment 'nsegment(1,0.3,0.7)';
SELECT nsegment 'nsegment(1,0.3,0.5)' != nsegment 'nsegment(1,0.5,0.7)';
SELECT nsegment 'nsegment(1,0.3,0.5)' != nsegment 'nsegment(2,0.3,0.5)';

SELECT nsegment 'nsegment(1,0.3,0.5)' < nsegment 'nsegment(1,0.3,0.5)';
SELECT nsegment 'nsegment(1,0.3,0.5)' < nsegment 'nsegment(1,0.3,0.7)';
SELECT nsegment 'nsegment(1,0.3,0.5)' < nsegment 'nsegment(1,0.5,0.7)';
SELECT nsegment 'nsegment(1,0.3,0.5)' < nsegment 'nsegment(2,0.3,0.5)';

SELECT nsegment 'nsegment(1,0.3,0.5)' <= nsegment 'nsegment(1,0.3,0.5)';
SELECT nsegment 'nsegment(1,0.3,0.5)' <= nsegment 'nsegment(1,0.3,0.7)';
SELECT nsegment 'nsegment(1,0.3,0.5)' <= nsegment 'nsegment(1,0.5,0.7)';
SELECT nsegment 'nsegment(1,0.3,0.5)' <= nsegment 'nsegment(2,0.3,0.5)';

SELECT nsegment 'nsegment(1,0.3,0.5)' > nsegment 'nsegment(1,0.3,0.5)';
SELECT nsegment 'nsegment(1,0.3,0.5)' > nsegment 'nsegment(1,0.3,0.7)';
SELECT nsegment 'nsegment(1,0.3,0.5)' > nsegment 'nsegment(1,0.5,0.7)';
SELECT nsegment 'nsegment(1,0.3,0.5)' > nsegment 'nsegment(2,0.3,0.5)';

SELECT nsegment 'nsegment(1,0.3,0.5)' >= nsegment 'nsegment(1,0.3,0.5)';
SELECT nsegment 'nsegment(1,0.3,0.5)' >= nsegment 'nsegment(1,0.3,0.7)';
SELECT nsegment 'nsegment(1,0.3,0.5)' >= nsegment 'nsegment(1,0.5,0.7)';
SELECT nsegment 'nsegment(1,0.3,0.5)' >= nsegment 'nsegment(2,0.3,0.5)';

-------------------------------------------------------------------------------/

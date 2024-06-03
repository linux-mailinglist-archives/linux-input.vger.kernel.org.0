Return-Path: <linux-input+bounces-4044-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C5D8D7FD3
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2024 12:15:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 483E81C2326F
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2024 10:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBF2E6F513;
	Mon,  3 Jun 2024 10:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kuku.eu.org header.i=qq@kuku.eu.org header.b="FQYSKSws"
X-Original-To: linux-input@vger.kernel.org
Received: from o202.p27.mailjet.com (o202.p27.mailjet.com [185.189.238.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E988378C80
	for <linux-input@vger.kernel.org>; Mon,  3 Jun 2024 10:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.189.238.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717409704; cv=none; b=Qq7mUzpS6bJWy3EzCq8JQuPHLa33UhcfJ5BrkX3n19yOX6Qmx7DO+osKGbWDYDC5Eza0EYtOHAMx3Hldg1EuqLBpytFkN8VIne1Fl7xtkW0H2CDYN2kcmHefOAjLL49tNN9hb1lU+vB1QS4nw5N2zougn6AAllosdOioOd5d8yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717409704; c=relaxed/simple;
	bh=zq7vPYit/vWplG18B/glwY88nytC63/wCv18k2AIJps=;
	h=Message-Id:MIME-Version:From:To:Subject:Date:Cc:Content-Type; b=Gg8eoV+NIfLVMMnhKgWB2z+0HwEPhE2WU9v1JSIZtYcyTbk1B+gFHuUgyrpIr2MfS3Mf+9WlC7wA0R217m75X/Di0iFObyUKUoGe993n1flv9PxusC39NCutQgYiVDHVS5OJNbQby150OK8bPMqjTqSQ7pbdvGSUtVB1DbHqBh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kuku.eu.org; spf=pass smtp.mailfrom=a1759471.bnc3.mailjet.com; dkim=pass (1024-bit key) header.d=kuku.eu.org header.i=qq@kuku.eu.org header.b=FQYSKSws; arc=none smtp.client-ip=185.189.238.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kuku.eu.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=a1759471.bnc3.mailjet.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; q=dns/txt;
  d=kuku.eu.org; i=qq@kuku.eu.org; s=mailjet; x=1717416891;
  h=message-id:mime-version:from:from:to:to:subject:subject:date:date:list-unsubscribe:list-unsubscribe-post:
  cc:feedback-id:x-csa-complaints:x-mj-mid:x-mj-smtpguid:x-report-abuse-to:
  x-spam-checker-version:x-spam-status:content-language:content-type:
  content-transfer-encoding;
  bh=zq7vPYit/vWplG18B/glwY88nytC63/wCv18k2AIJps=;
  b=FQYSKSwslWnl3donPbOCK9xgbUKQCZnJ7qkBeHhEHqJf7CLYmBsoTBw07
 y+StEKY4+SYoh/4iKjas3fgbWMlE6SIw9wNhc3nx78oZLkm3wOLTaV2onE1u
 z26Pm2I9iL7+EaI8CmpUQi1Q1i44kdhmVTj2j65VPsnjG+Z/ym1YWQ=
Message-Id: <9e6d99ab.AVMAAEMa2AwAAAAAAAAAAe3xe90AAYCrT0UAAAAAABrY7wBmXZeb@mailjet.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Andrzej Szombierski <qq@kuku.eu.org>
To: linux-input@vger.kernel.org
Subject: HIDRAW handling of non-numbered reports doesn't match documentation
Date: Mon, 3 Jun 2024 12:14:42 +0200
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Feedback-Id: 42.1759471.1692858:MJ
X-CSA-Complaints: csa-complaints@eco.de
X-MJ-Mid:
	AVMAAEMa2AwAAAAAAAAAAe3xe90AAYCrT0UAAAAAABrY7wBmXZebZcWtoD_CRbCvdcaTPOQi1gAZ1Lo
X-MJ-SMTPGUID: 65c5ada0-3fc2-45b0-af75-c6933ce422d6
X-REPORT-ABUSE-TO: Message sent by Mailjet please report to
	abuse@mailjet.com with a copy of the message
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

I've recently encountered a discrepancy in the hidraw device's handling 
of non-numbered reports on HIDIOCGINPUT and HIDIOCGOUTPUT. The docs 
state that "For devices which do not use numbered reports, the report 
data will begin at the first byte of the returned buffer". The actual 
implementation doesn't follow this rule, and always prepends a report ID 
(in this case: zero). I've linked an example reproducer at the end.

This issue was actually raised before by Andrey Smirnov, but the 
discussion seems to have sidetracked towards implementation details.

https://lore.kernel.org/linux-input/CADyDSO4uh6b+sSZTkZ2_DR923=bA=kXgK1LqUMkknCMzf_DSwQ@mail.gmail.com/

The main question is: will this behavior be modified to match the 
documentation someday? This would necessarily break any userspace 
already using hidraw. Or should this be now considered a documentation bug?

Example code: 
https://gist.github.com/anszom/e681df62b53209082a1798836edadff3

$ sudo ./hidraw  /dev/hidraw3
Testing device: Logitech USB Receiver
Device uses numbered reports: NO
input report 0 = 00 01 00 00 00 00 00 00 (ctrl key pressed)
output report 0 = 00 02 00 00 00 00 00 00 (caps lock LED on)

-- 

Andrzej Szombierski

qq@kuku.eu.org



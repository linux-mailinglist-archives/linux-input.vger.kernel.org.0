Return-Path: <linux-input+bounces-17183-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C97D39270
	for <lists+linux-input@lfdr.de>; Sun, 18 Jan 2026 04:32:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90F933011432
	for <lists+linux-input@lfdr.de>; Sun, 18 Jan 2026 03:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 508DF5CDF1;
	Sun, 18 Jan 2026 03:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bitmath.se header.i=@bitmath.se header.b="ORp38rbS";
	dkim=permerror (0-bit key) header.d=bitmath.se header.i=@bitmath.se header.b="eiJzs5iD"
X-Original-To: linux-input@vger.kernel.org
Received: from mailrelay-egress5.pub.mailoutpod3-cph3.one.com (mailrelay-egress5.pub.mailoutpod3-cph3.one.com [46.30.211.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FA9D515
	for <linux-input@vger.kernel.org>; Sun, 18 Jan 2026 03:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.244
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768707165; cv=none; b=nV2YhwaD32dNAFCB3WiHcSvZrTaLE8FJsJWZ0fSw+hRam/g2AREWbbNic0DYwbDPavuULu8hse61bixQXLwUrpHhKEvRykEIk3+UFsE/fSPCGqX1nIDNTeRvn9zy12Ghp/n5MnEDvFEMUJu07NFyGA6iBGUeh+j6YgjvMoip03c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768707165; c=relaxed/simple;
	bh=4+uaXlTEK42s17IUO1SpZlBbk/Lv2+k8x50v3rY7tf4=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=DgTGiaxj+mvmQSkL55HBAmv5MEgwnjEi8FO5rXSVSNJW1o9T/UZ67J8dM9xHfT33Prn6xceaIYf8YjLABHd4zyDRozMi1N+hTNQ85OFOCJeEDzQk6HAIFgS0puYeWj/GTLefNsYZrCX5P7VCesfSwZR9vGcXft2/7eTJT8L1Rxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bitmath.se; spf=none smtp.mailfrom=bitmath.se; dkim=pass (2048-bit key) header.d=bitmath.se header.i=@bitmath.se header.b=ORp38rbS; dkim=permerror (0-bit key) header.d=bitmath.se header.i=@bitmath.se header.b=eiJzs5iD; arc=none smtp.client-ip=46.30.211.244
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bitmath.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bitmath.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1768707152; x=1769311952;
	d=bitmath.se; s=rsa2;
	h=in-reply-to:from:references:cc:to:subject:mime-version:date:message-id:
	 content-type:from;
	bh=Lgh3ACCYfhc4UXp9Rh+IPpjuMbjF/c45sbz0TrQT4yA=;
	b=ORp38rbS4c9wEZGM41nc3SY+zXA8GPUVUJ/07MYECkFib1pjpvWfdrxwEgRr6gXNu7qnPjnlttEhH
	 7jedj8zJuW1N93fk/D1l3IsQDWWaUWSDmtc3Elh8ggPFa9RPA83WjC0z9KAZZeeLWgg11NgmD1Hvxi
	 OtELxRE2DZwat5ipZzDz3FFfhDR3JoBtm1FHo5UsehzRORlOOmjU82eJwcPmNtgsfC/EYuNnEjv6Ni
	 Gu1z2wdD/ULo7JV3qbsHiWVF5U0fvylMm5OZoDTlPVK7MbuAArjLijy19irWf0CA5Ny3IjX+BAPHQu
	 WZXBqcNVkQ6o2XqlJR/S5FYwRD03Dqg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1768707152; x=1769311952;
	d=bitmath.se; s=ed2;
	h=in-reply-to:from:references:cc:to:subject:mime-version:date:message-id:
	 content-type:from;
	bh=Lgh3ACCYfhc4UXp9Rh+IPpjuMbjF/c45sbz0TrQT4yA=;
	b=eiJzs5iDspL26Rh4U4CZAr8Tha92cTfoRs/NxRRyXd4446j0wb5ibfjqiAmJ6XS/7my8VYYRT8agO
	 jnoqS2CAw==
X-HalOne-ID: 5171af77-f41e-11f0-96a4-85eb291bc831
Received: from [192.168.19.13] (h-94-254-62-230.na.cust.bahnhof.se [94.254.62.230])
	by mailrelay5.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 5171af77-f41e-11f0-96a4-85eb291bc831;
	Sun, 18 Jan 2026 03:32:31 +0000 (UTC)
Content-Type: multipart/mixed; boundary="------------n6Lkj05HIbay0AbczCaHCYoQ"
Message-ID: <6880b5ba-ee76-4a9e-a116-16843a737b34@bitmath.se>
Date: Sun, 18 Jan 2026 04:33:07 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: bcm5974 trackpad broken after USB reset
To: Liam Mitchell <mitchell.liam@gmail.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org
References: <CAOQ1CL4+DP1TuLAGNsz5GdFBTHvnTg=5q=Dr2Z1OQc6RXydSYA@mail.gmail.com>
 <38ea07c1-50ce-4342-aba9-fe2f4bc6c503@bitmath.se>
 <CAOQ1CL6G6eDcX+Qth3D531h72wW3RmvecCWjr5nAT-UdDWg40w@mail.gmail.com>
Content-Language: en-US
From: Henrik Rydberg <rydberg@bitmath.se>
Autocrypt: addr=rydberg@bitmath.se; keydata=
 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 nQ==
In-Reply-To: <CAOQ1CL6G6eDcX+Qth3D531h72wW3RmvecCWjr5nAT-UdDWg40w@mail.gmail.com>

This is a multi-part message in MIME format.
--------------n6Lkj05HIbay0AbczCaHCYoQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Thanks for the pointer. The wellspring mode switch is definitely
> attempted. The bcm5974 driver does the mode switching in input_dev
> open/close hooks. These are called multiple times after reset. See the
> following logs produced after `sudo usbreset 05ac:0259`.

Indeed, the correct path appears to be taken, so that was not it. Maybe 
the device internals do take some extra time to complete. Presumably 
there is a status field in the control message data; printing it out 
might reveal something.

Here is a completely untested patch which tries to verify that the mode 
is properly set, and dumps the control data in the process. With a bit 
of luck, this will just work because of the added delay, but if not, we 
might be able to figure out the status change.

Henrik


--------------n6Lkj05HIbay0AbczCaHCYoQ
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-untested-bcm5974-verify-mode-switch.patch"
Content-Disposition: attachment;
 filename="0001-untested-bcm5974-verify-mode-switch.patch"
Content-Transfer-Encoding: base64

RnJvbSBhMGJiZDZiNWE5YTRmMDVjODVhMjUyYWNlODEyOWNkYTA2ODlmYjQ1IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBIZW5yaWsgUnlkYmVyZyA8cnlkYmVyZ0BiaXRtYXRo
LnNlPgpEYXRlOiBTdW4sIDE4IEphbiAyMDI2IDA0OjE2OjA3ICswMTAwClN1YmplY3Q6IFtQ
QVRDSF0gW3VudGVzdGVkXSBiY201OTc0OiB2ZXJpZnkgbW9kZSBzd2l0Y2gKCi0tLQogZHJp
dmVycy9pbnB1dC9tb3VzZS9iY201OTc0LmMgfCAxNyArKysrKysrKysrKysrKysrKwogMSBm
aWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lu
cHV0L21vdXNlL2JjbTU5NzQuYyBiL2RyaXZlcnMvaW5wdXQvbW91c2UvYmNtNTk3NC5jCmlu
ZGV4IGRmZGZiNTljYzhiNS4uY2FiZTA0ZDhlMzJkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2lu
cHV0L21vdXNlL2JjbTU5NzQuYworKysgYi9kcml2ZXJzL2lucHV0L21vdXNlL2JjbTU5NzQu
YwpAQCAtNjQ4LDYgKzY0OCw3IEBAIHN0YXRpYyBpbnQgYmNtNTk3NF93ZWxsc3ByaW5nX21v
ZGUoc3RydWN0IGJjbTU5NzQgKmRldiwgYm9vbCBvbikKIHsKIAljb25zdCBzdHJ1Y3QgYmNt
NTk3NF9jb25maWcgKmMgPSAmZGV2LT5jZmc7CiAJaW50IHJldHZhbCA9IDAsIHNpemU7CisJ
aW50IHJldHJpZXMgPSAzOwogCWNoYXIgKmRhdGE7CiAKIAkvKiBUeXBlIDMgZG9lcyBub3Qg
cmVxdWlyZSBhIG1vZGUgc3dpdGNoICovCkBAIC02NjEsNiArNjYyLDcgQEAgc3RhdGljIGlu
dCBiY201OTc0X3dlbGxzcHJpbmdfbW9kZShzdHJ1Y3QgYmNtNTk3NCAqZGV2LCBib29sIG9u
KQogCQlnb3RvIG91dDsKIAl9CiAKKyBhZ2FpbjoKIAkvKiByZWFkIGNvbmZpZ3VyYXRpb24g
Ki8KIAlzaXplID0gdXNiX2NvbnRyb2xfbXNnKGRldi0+dWRldiwgdXNiX3JjdmN0cmxwaXBl
KGRldi0+dWRldiwgMCksCiAJCQlCQ001OTc0X1dFTExTUFJJTkdfTU9ERV9SRUFEX1JFUVVF
U1RfSUQsCkBAIC02NzMsNiArNjc1LDE4IEBAIHN0YXRpYyBpbnQgYmNtNTk3NF93ZWxsc3By
aW5nX21vZGUoc3RydWN0IGJjbTU5NzQgKmRldiwgYm9vbCBvbikKIAkJZ290byBvdXQ7CiAJ
fQogCisJaWYgKGRhdGFbYy0+dW1fc3dpdGNoX2lkeF0gPT0gKG9uID8gYy0+dW1fc3dpdGNo
X29uIDogYy0+dW1fc3dpdGNoX29mZikpCisJCWdvdG8gc3VjY2VzczsKKworCWlmICghcmV0
cmllcy0tKSB7CisJCWRwcmludGsoMiwgImJjbTU5NzQ6IGZhaWxlZCB0byBzd2l0Y2ggdG8g
JXMgbW9kZS5cbiIsCisJCQlvbiA/ICJ3ZWxsc3ByaW5nIiA6ICJub3JtYWwiKTsKKwkJcmV0
dmFsID0gLUVOT0VOVDsKKwkJZ290byBvdXQ7CisJfQorCisJcHJpbnRfaGV4X2R1bXBfYnl0
ZXMoImJjbTU5NzQ6IGNvbnRyb2wgZGF0YTogIiwgRFVNUF9QUkVGSVhfTk9ORSwgZGF0YSwg
c2l6ZSk7CisKIAkvKiBhcHBseSB0aGUgbW9kZSBzd2l0Y2ggKi8KIAlkYXRhW2MtPnVtX3N3
aXRjaF9pZHhdID0gb24gPyBjLT51bV9zd2l0Y2hfb24gOiBjLT51bV9zd2l0Y2hfb2ZmOwog
CkBAIC02ODgsNiArNzAyLDkgQEAgc3RhdGljIGludCBiY201OTc0X3dlbGxzcHJpbmdfbW9k
ZShzdHJ1Y3QgYmNtNTk3NCAqZGV2LCBib29sIG9uKQogCQlnb3RvIG91dDsKIAl9CiAKKwln
b3RvIGFnYWluOworCisgc3VjY2VzczoKIAlkcHJpbnRrKDIsICJiY201OTc0OiBzd2l0Y2hl
ZCB0byAlcyBtb2RlLlxuIiwKIAkJb24gPyAid2VsbHNwcmluZyIgOiAibm9ybWFsIik7CiAK
LS0gCjIuNTIuMAoK

--------------n6Lkj05HIbay0AbczCaHCYoQ--


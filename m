Return-Path: <linux-input+bounces-5088-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E59B79374AC
	for <lists+linux-input@lfdr.de>; Fri, 19 Jul 2024 10:03:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21A041C20DC3
	for <lists+linux-input@lfdr.de>; Fri, 19 Jul 2024 08:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 164C55C614;
	Fri, 19 Jul 2024 08:03:45 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A43482ED;
	Fri, 19 Jul 2024 08:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721376225; cv=none; b=gFOCngTiRzE2SlTC6/n13cK1YX3VJ2/JQX6tf+/lJYPBuDZ/3Fc6V0XYwR9lJT539PASPZiPqe9bQS/7sRpHRjd+9/2LQ0E9klYbODzelQEGCnS6WLTsUnxgIbK0+H3UCuavXVoIBvLEfCHtPaKJ47Ygb9ExKlmg+pCY9EUZukA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721376225; c=relaxed/simple;
	bh=bxQpRIxO+p5WkJNaBFEIJKuPh7hpLUGh3Nps12uHS64=;
	h=From:Subject:To:Date:Message-ID:References:MIME-Version:
	 Content-Type; b=CcEHNwbQM3BV7bdYxMRcwX1AOmxOCbmtwaEecPDur2hU/xXVpiJFALmNVHEVBO/1GwV2WouklKg3XQhwlUe4tE/w6876ffFxWAdmr9Jyr4yq8ddk5JCpx1xUNr6JU6xWjnzICgQZVDZpnC1F7hq9L5UEfPCywgPWlhwPSiLnFUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: f01a57b445a311ef93f4611109254879-20240719
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:cfb73a9e-d92a-4a1e-87a8-7722a916ee0f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:82c5f88,CLOUDID:2de2fbe0743d755dfaea168b7386c7cd,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:0,Content:0,EDM:-3,IP:nil,URL:0,F
	ile:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
	,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f01a57b445a311ef93f4611109254879-20240719
Received: from mail.kylinos.cn [(10.44.16.189)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 767770583; Fri, 19 Jul 2024 15:53:08 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 10C6571E859C;
	Fri, 19 Jul 2024 15:53:08 +0800 (CST)
Received: by mail.kylinos.cn (NSMail, from userid 0)
	id EABBF71E859C; Fri, 19 Jul 2024 15:53:07 +0800 (CST)
From: =?UTF-8?B?6Im+6LaF?= <aichao@kylinos.cn>
Subject: =?UTF-8?B?W1BBVENIXSBISUQ6IGNvcmU6IEZpeCBwYXJzaW5nIGVycm9yIGZvciBUaGlua2Jvb2sxNiBHNisgSU1I?=
To: 	=?UTF-8?B?amlrb3M=?= <jikos@kernel.org>,
	=?UTF-8?B?YmVudGlzcw==?= <bentiss@kernel.org>,
	=?UTF-8?B?bGludXgtaW5wdXQ=?= <linux-input@vger.kernel.org>,
	=?UTF-8?B?bGludXgta2VybmVs?= <linux-kernel@vger.kernel.org>,
Date: Fri, 19 Jul 2024 15:53:07 +0800
X-Mailer: NSMAIL 7.0.0
Message-ID: <12vo1pesman-12vrviv1rs0@nsmail7.0.0--kylin--1>
References: 20240719074809.14892-1-aichao@kylinos.cn
X-Israising: 0
X-Seclevel-1: 0
X-Seclevel: 0
X-Delaysendtime: Fri, 19 Jul 2024 15:53:07 +0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary=nsmail-15vx8j1lmg2-15vzseofq3n
X-ns-mid: webmail-669a1b63-15qodi3q
X-ope-from: <aichao@kylinos.cn>

This message is in MIME format.

--nsmail-15vx8j1lmg2-15vzseofq3n
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PHA+Rml4IHBhcnNpbmcgZXJyb3IgZm9yIFRoaW5rQm9vazE2IEc2KyBJTUgu
PC9wPgo8cD5EZXZpY2U6IFRvdWNocGFkIEZYVFA1MTAwPC9wPgo8cD5oaWQt
Z2VuZXJpYyAwMDE4OjI3QzY6MDFFOS4wMDA0OiBpdGVtIDAgMSAwIDExIHBh
cnNpbmcgZmFpbGVkPC9wPgo8cD5oaWQtZ2VuZXJpYyAwMDE4OjI3QzY6MDFF
OS4wMDA0OiBwcm9iZSB3aXRoIGRyaXZlciBoaWQtZ2VuZXJpYyBmYWlsZWQ8
L3A+CjxwPndpdGggZXJyb3IgLTIyPC9wPgo8cD5oaWQtbXVsdGl0b3VjaCAw
MDE4OjI3QzY6MDFFOS4wMDA0OiBpdGVtIDAgMSAwIDExIHBhcnNpbmcgZmFp
bGVkPC9wPgo8cD5oaWQtbXVsdGl0b3VjaCAwMDE4OjI3QzY6MDFFOS4wMDA0
OiBwcm9iZSB3aXRoIGRyaXZlciBoaWQtZ2VuZXJpYzwvcD4KPHA+ZmFpbGVk
IHdpdGggZXJyb3IgLTIyPC9wPgo8cD5XaGVuIHRoZSBkcml2ZXIgbG9hZCBh
bmQgcGFyc2luZyBhIG1haW4gaXRlbSw8L3A+CjxwPnBhcnNlci0mZ3Q7Z2xv
YmFsLmxvZ2ljYWxfbWluaW11bSBpcyBsYXJnZXIgdGhhbjwvcD4KPHA+cGFy
c2VyLSZndDtnbG9iYWwubG9naWNhbF9tYXhpbXVtLjwvcD4KPHA+cGFyc2Vy
LSZndDtnbG9iYWwubG9naWNhbF9taW5pbXVtIGlzIDB4NjQgYW5kPC9wPgo8
cD5wYXJzZXItJmd0O2dsb2JhbC5sb2dpY2FsX21heGltdW0gaXMgMHgxLjwv
cD4KPHA+Jm5ic3A7PC9wPgo8cD5DYzogQ2hlbnpoYW5nPC9wPgo8cD5TaWdu
ZWQtb2ZmLWJ5OiBBaSBDaGFvPC9wPgo8cD4tLS08L3A+CjxwPmRyaXZlcnMv
aGlkL2hpZC1jb3JlLmMgfCAxNSArKysrKysrKysrKysrKys8L3A+CjxwPjEg
ZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspPC9wPgo8cD4mbmJzcDs8
L3A+CjxwPmRpZmYgLS1naXQgYS9kcml2ZXJzL2hpZC9oaWQtY29yZS5jIGIv
ZHJpdmVycy9oaWQvaGlkLWNvcmUuYzwvcD4KPHA+aW5kZXggOTg4ZDBhY2Jk
ZjA0Li5jZmRjNGU3N2I4NDYgMTAwNjQ0PC9wPgo8cD4tLS0gYS9kcml2ZXJz
L2hpZC9oaWQtY29yZS5jPC9wPgo8cD4rKysgYi9kcml2ZXJzL2hpZC9oaWQt
Y29yZS5jPC9wPgo8cD5AQCAtMjcxLDYgKzI3MSwyMSBAQCBzdGF0aWMgaW50
IGhpZF9hZGRfZmllbGQoc3RydWN0IGhpZF9wYXJzZXIgKnBhcnNlciwgdW5z
aWduZWQgcmVwb3J0X3R5cGUsIHVuc2lnbjwvcD4KPHA+cmV0dXJuIC0xOzwv
cD4KPHA+fTwvcD4KPHA+Jm5ic3A7PC9wPgo8cD4rIC8qPC9wPgo8cD4rICog
TGVub3ZvIFRoaW5rQm9vazE2IEc2KyBJTUg6PC9wPgo8cD4rICogVG91Y2hw
YWQgRlhUUDUxMDAgcGFyc2luZyBlcnJvcjwvcD4KPHA+KyAqIDAwMTg6MjdD
NjowMUU5LjAwMDQ6IGl0ZW0gMCAxIDAgMTEgcGFyc2luZyBmYWlsZWQ8L3A+
CjxwPisgKi88L3A+CjxwPisgaWYgKHBhcnNlci0mZ3Q7ZGV2aWNlLSZndDt2
ZW5kb3IgPT0gMHgyN2M2ICZhbXA7JmFtcDs8L3A+CjxwPisgcGFyc2VyLSZn
dDtkZXZpY2UtJmd0O3Byb2R1Y3QgPT0gMHgwMWU5ICZhbXA7JmFtcDs8L3A+
CjxwPisgKHBhcnNlci0mZ3Q7Z2xvYmFsLmxvZ2ljYWxfbWluaW11bSAmZ3Q7
PSAwICZhbXA7JmFtcDs8L3A+CjxwPisgKF9fdTMyKXBhcnNlci0mZ3Q7Z2xv
YmFsLmxvZ2ljYWxfbWF4aW11bSBnbG9iYWwubG9naWNhbF9taW5pbXVtKSkg
ezwvcD4KPHA+KyB1c2FnZXMgPSBwYXJzZXItJmd0O2dsb2JhbC5sb2dpY2Fs
X21pbmltdW07PC9wPgo8cD4rIHBhcnNlci0mZ3Q7Z2xvYmFsLmxvZ2ljYWxf
bWluaW11bSA9IHBhcnNlci0mZ3Q7Z2xvYmFsLmxvZ2ljYWxfbWF4aW11bTs8
L3A+CjxwPisgcGFyc2VyLSZndDtnbG9iYWwubG9naWNhbF9tYXhpbXVtID0g
dXNhZ2VzOzwvcD4KPHA+KyB9PC9wPgo8cD4rPC9wPgo8cD4vKiBIYW5kbGUg
Ym90aCBzaWduZWQgYW5kIHVuc2lnbmVkIGNhc2VzIHByb3Blcmx5ICovPC9w
Pgo8cD5pZiAoKHBhcnNlci0mZ3Q7Z2xvYmFsLmxvZ2ljYWxfbWluaW11bSBw
YXJzZXItJmd0O2dsb2JhbC5sb2dpY2FsX21heGltdW08L3A+CjxkaXYgaWQ9
InJlIiBzdHlsZT0ibWFyZ2luLWxlZnQ6IDAuNWVtOyBwYWRkaW5nLWxlZnQ6
IDAuNWVtOyBib3JkZXItbGVmdDogMXB4IHNvbGlkIGdyZWVuOyI+PC9kaXY+


--nsmail-15vx8j1lmg2-15vzseofq3n--


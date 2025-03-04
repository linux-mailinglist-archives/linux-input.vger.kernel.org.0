Return-Path: <linux-input+bounces-10519-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E496BA4D8BC
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 10:39:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71A8F3AF5F7
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 09:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E26F71F4CAD;
	Tue,  4 Mar 2025 09:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=g-sokol-info.20230601.gappssmtp.com header.i=@g-sokol-info.20230601.gappssmtp.com header.b="AP1NFZJF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C171FC0F9
	for <linux-input@vger.kernel.org>; Tue,  4 Mar 2025 09:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741080623; cv=none; b=UOlvsr+MoYjHJl08EIHRXazdaTXU2VDSGmNMUyxK6kha8yYplno0/ZzlbtKDEwbLGN6Hfyl/hMNajYyeA4LhC6rzPyglTjA/PQbS2juK9oFJkwDAcnPV9li1sLL2fMsFZNzNI3Tfd1aX7ihKfQ7AFnpNCfHsjom2OHe4yhwKROA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741080623; c=relaxed/simple;
	bh=DnanMfJ+TEfD5yb/Ro6fCh07gRTi+A1yhBXFvg+oxc0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=j9IE1zFSehTkZU7cY2/e30yB1lSgH4S0YxREjltGMBPdNSzm7VUewnJnbbx8qP7hQw345Fai+ZX+3zEZj+PDsE3kYW/DKEXPN7vTq4DPUJnLvLXqSNYthET/OE6i93JgUsJRmqnwinU1ZiTrEoYYLq+gi9o7nDTwHHu/vdRETAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=g-sokol.info; spf=none smtp.mailfrom=g-sokol.info; dkim=pass (2048-bit key) header.d=g-sokol-info.20230601.gappssmtp.com header.i=@g-sokol-info.20230601.gappssmtp.com header.b=AP1NFZJF; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=g-sokol.info
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=g-sokol.info
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-390f5f48eafso1636193f8f.0
        for <linux-input@vger.kernel.org>; Tue, 04 Mar 2025 01:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=g-sokol-info.20230601.gappssmtp.com; s=20230601; t=1741080620; x=1741685420; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7qlBA+OmiT//8rSlkYpOeICO3rUdA2tybOQwn+Kd4Qc=;
        b=AP1NFZJFgUdrK9pE1WnDdz8XcR3YDWoFJ0tW+24u4tOVBDhVmGMlenefoZHwRBe5iV
         19BJjUzC9cliyVaSjjcilvTAwdzfznwQ3tk/lUi5otV5inSNU/Q8ZeCY0fntCCLQpakW
         kjPWM5+5s5pl1qHfZJfh4q8BHkESC5QvNZW1leUbqY+HNAWwADw+sflNXXm7Ce4iYrEi
         ROk+ODOMl2jW2EgVOWZTBidhmn3/QCg29N84prdNKYkom4u7Jq6r0yhMWGCwniK/PZtL
         pBmSkTIwdUM+cAKZcUTpF8kYDj03neD9bIynE3G1jGgBHzUYBlpjGypiI/E5pXxGKWtJ
         /zIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741080620; x=1741685420;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7qlBA+OmiT//8rSlkYpOeICO3rUdA2tybOQwn+Kd4Qc=;
        b=wcmeBNjjyXwjnPm4X6Pm7JO4NvZ7k/N5cU7LSyiF8gSVTsaS0AxLIsyjS4px5JMb0h
         AT2cYsQb6YKHq1oaaEFAPJFwnu06LUi00oqrcZiw3Sb2c0xoLF2xOInwBWhRE/Ntjm9Y
         y2af/+HsV1/oxQtYy9OdxMuTyJ1mgXuyPJ6kMfVh4/QcdEHLiRGj+xqoep6tAWM2W6lp
         Y8V9G+SPknRIXnw4+dc7Rk99nmMLHIvCxlpwhMd3XNy7f05+0Np8AoeoeUO0AimAOdck
         pXXKb+D0ZO2bNvvs6/0uOu2nzhWPlwi6KPXJ1fzqLNftbBmsvtq+q1xdN/gH4VCOsO1u
         FtEg==
X-Gm-Message-State: AOJu0Yx6r/hviL0aF41WngahhfC5yLMDz8lqPxz7wdSLFWZUsubHl2tz
	Qr6R8Dat0vFWJS/6JTOb9vuPbxtb6Dr2Ba8Ag7gsy+A3HfLfzIt/3CDCpJzzTyn/PWJUJuQceJT
	YnX/IYecMalT5053qagoRP+h6Z9Ohuqt52PofeDDsmz0PE0JlTdOqVDfo
X-Gm-Gg: ASbGnctoUrcKLq1CSoZj/3aCy2rSlYZldLTJAeUPSedTnPa5VffQyRNebT08QFY8jvo
	ysdIGXowPyv2ppi+8+Ggl5x2jScpWFMx9DlOa9e1gvNtKsuLxVEhGpUm15GG1gMGSp2HOyDBGSS
	K/7ABLqp3C6Fygz9px0pvXRRlCiQI=
X-Google-Smtp-Source: AGHT+IF3gIuybhOFvz0JCilgYwupJ/z+V4HGUstLyUty3GUUNe1QCHx0V6bUCyr0Y5k+IH/tZdWZ7B8m/QcmhwLR29w=
X-Received: by 2002:a05:6000:144f:b0:390:ed71:8f01 with SMTP id
 ffacd0b85a97d-390ed718f47mr10631432f8f.29.1741080619925; Tue, 04 Mar 2025
 01:30:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Grigorii Sokolik <g.sokol99@g-sokol.info>
Date: Tue, 4 Mar 2025 11:30:08 +0200
X-Gm-Features: AQ5f1JoI1SUq5Modxx7t70VA99cFJlQjcMBFVITUNll97_LJgFqzBMSgeq-9SOY
Message-ID: <CADjZRiRRM1f9QU3Sy4e+n_sk_Sj2248MOaGSV65SpTbiZibzOA@mail.gmail.com>
Subject: Backport of 6.14-rc5 commit 2813e00dcd748cef47d2bffaa04071de93fddf00
 to 6.13
To: linux-input@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000e0af96062f80eb3c"

--000000000000e0af96062f80eb3c
Content-Type: multipart/alternative; boundary="000000000000e0af95062f80eb3a"

--000000000000e0af95062f80eb3a
Content-Type: text/plain; charset="UTF-8"

Backporting the commit and supporting apple 0x0320 keyboard and alos
supporting new apple keyboard deviceID: 0x0321

Add Apple Magic Keyboard 2024 model (with USB-C port) device ID (0321)
to those recognized by the hid-apple driver. Keyboard is otherwise
compatible with the existing implementation for its earlier 2021 model.


-- 

Thanks!
Kind regards,
Grigorii!

--000000000000e0af95062f80eb3a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Backporting the commit and supporting apple 0x0320 ke=
yboard and alos supporting new apple keyboard deviceID: 0x0321</div><div><b=
r></div><div>Add Apple Magic Keyboard 2024 model (with USB-C port) device I=
D (0321)<br>to those recognized by the hid-apple driver. Keyboard is otherw=
ise<br>compatible with the existing implementation for its earlier 2021 mod=
el.</div><div><br></div><div><br></div><span class=3D"gmail_signature_prefi=
x">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr"><br><div>Thanks!</div><div>Kind regar=
ds,</div><div>Grigorii!<br></div></div></div></div>

--000000000000e0af95062f80eb3a--
--000000000000e0af96062f80eb3c
Content-Type: application/octet-stream; name=linux-patch
Content-Disposition: attachment; filename=linux-patch
Content-Transfer-Encoding: base64
Content-ID: <f_m7uafd3p0>
X-Attachment-Id: f_m7uafd3p0

ZGlmZiAtLWNvbG9yIC11cHJOIGxpbnV4LTYuMTMuNS12YW5pbGxhL2RyaXZlcnMvaGlkL2hpZC1h
cHBsZS5jIGxpbnV4LTYuMTMuNS9kcml2ZXJzL2hpZC9oaWQtYXBwbGUuYwotLS0gbGludXgtNi4x
My41LXZhbmlsbGEvZHJpdmVycy9oaWQvaGlkLWFwcGxlLmMJMjAyNS0wMy0wNCAxMDowNDozMi4y
NTI1NDE0ODMgKzAyMDAKKysrIGxpbnV4LTYuMTMuNS9kcml2ZXJzL2hpZC9oaWQtYXBwbGUuYwky
MDI1LTAzLTA0IDExOjE1OjQ0LjQ0OTY2NDIxNSArMDIwMApAQCAtNDc0LDYgKzQ3NCw4IEBAIHN0
YXRpYyBpbnQgaGlkaW5wdXRfYXBwbGVfZXZlbnQoc3RydWN0IGgKIAkJCSBoaWQtPnByb2R1Y3Qg
PT0gVVNCX0RFVklDRV9JRF9BUFBMRV9NQUdJQ19LRVlCT0FSRF9OVU1QQURfMjAxNSkKIAkJCXRh
YmxlID0gbWFnaWNfa2V5Ym9hcmRfMjAxNV9mbl9rZXlzOwogCQllbHNlIGlmIChoaWQtPnByb2R1
Y3QgPT0gVVNCX0RFVklDRV9JRF9BUFBMRV9NQUdJQ19LRVlCT0FSRF8yMDIxIHx8CisJCQkgaGlk
LT5wcm9kdWN0ID09IFVTQl9ERVZJQ0VfSURfQVBQTEVfTUFHSUNfS0VZQk9BUkRfMjAyNCB8fAor
CQkJIGhpZC0+cHJvZHVjdCA9PSBVU0JfREVWSUNFX0lEX0FQUExFX01BR0lDX0tFWUJPQVJEXzIw
MjRfVjIgfHwKIAkJCSBoaWQtPnByb2R1Y3QgPT0gVVNCX0RFVklDRV9JRF9BUFBMRV9NQUdJQ19L
RVlCT0FSRF9GSU5HRVJQUklOVF8yMDIxIHx8CiAJCQkgaGlkLT5wcm9kdWN0ID09IFVTQl9ERVZJ
Q0VfSURfQVBQTEVfTUFHSUNfS0VZQk9BUkRfTlVNUEFEXzIwMjEpCiAJCQl0YWJsZSA9IGFwcGxl
MjAyMV9mbl9rZXlzOwpAQCAtMTE1MCw2ICsxMTUyLDE0IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
aGlkX2RldmljZV9pZCBhcHBsZV8KIAkJLmRyaXZlcl9kYXRhID0gQVBQTEVfSEFTX0ZOIHwgQVBQ
TEVfSVNPX1RJTERFX1FVSVJLIHwgQVBQTEVfUkRFU0NfQkFUVEVSWSB9LAogCXsgSElEX0JMVUVU
T09USF9ERVZJQ0UoQlRfVkVORE9SX0lEX0FQUExFLCBVU0JfREVWSUNFX0lEX0FQUExFX01BR0lD
X0tFWUJPQVJEXzIwMjEpLAogCQkuZHJpdmVyX2RhdGEgPSBBUFBMRV9IQVNfRk4gfCBBUFBMRV9J
U09fVElMREVfUVVJUksgfSwKKwl7IEhJRF9VU0JfREVWSUNFKFVTQl9WRU5ET1JfSURfQVBQTEUs
IFVTQl9ERVZJQ0VfSURfQVBQTEVfTUFHSUNfS0VZQk9BUkRfMjAyNCksCisJCS5kcml2ZXJfZGF0
YSA9IEFQUExFX0hBU19GTiB8IEFQUExFX0lTT19USUxERV9RVUlSSyB8IEFQUExFX1JERVNDX0JB
VFRFUlkgfSwKKwl7IEhJRF9CTFVFVE9PVEhfREVWSUNFKEJUX1ZFTkRPUl9JRF9BUFBMRSwgVVNC
X0RFVklDRV9JRF9BUFBMRV9NQUdJQ19LRVlCT0FSRF8yMDI0KSwKKwkJLmRyaXZlcl9kYXRhID0g
QVBQTEVfSEFTX0ZOIHwgQVBQTEVfSVNPX1RJTERFX1FVSVJLIH0sCisJeyBISURfVVNCX0RFVklD
RShVU0JfVkVORE9SX0lEX0FQUExFLCBVU0JfREVWSUNFX0lEX0FQUExFX01BR0lDX0tFWUJPQVJE
XzIwMjRfVjIpLAorCQkuZHJpdmVyX2RhdGEgPSBBUFBMRV9IQVNfRk4gfCBBUFBMRV9JU09fVElM
REVfUVVJUksgfCBBUFBMRV9SREVTQ19CQVRURVJZIH0sCisJeyBISURfQkxVRVRPT1RIX0RFVklD
RShCVF9WRU5ET1JfSURfQVBQTEUsIFVTQl9ERVZJQ0VfSURfQVBQTEVfTUFHSUNfS0VZQk9BUkRf
MjAyNF9WMiksCisJCS5kcml2ZXJfZGF0YSA9IEFQUExFX0hBU19GTiB8IEFQUExFX0lTT19USUxE
RV9RVUlSSyB9LAogCXsgSElEX1VTQl9ERVZJQ0UoVVNCX1ZFTkRPUl9JRF9BUFBMRSwgVVNCX0RF
VklDRV9JRF9BUFBMRV9NQUdJQ19LRVlCT0FSRF9GSU5HRVJQUklOVF8yMDIxKSwKIAkJLmRyaXZl
cl9kYXRhID0gQVBQTEVfSEFTX0ZOIHwgQVBQTEVfSVNPX1RJTERFX1FVSVJLIHwgQVBQTEVfUkRF
U0NfQkFUVEVSWSB9LAogCXsgSElEX0JMVUVUT09USF9ERVZJQ0UoQlRfVkVORE9SX0lEX0FQUExF
LCBVU0JfREVWSUNFX0lEX0FQUExFX01BR0lDX0tFWUJPQVJEX0ZJTkdFUlBSSU5UXzIwMjEpLApk
aWZmIC0tY29sb3IgLXVwck4gbGludXgtNi4xMy41LXZhbmlsbGEvZHJpdmVycy9oaWQvaGlkLWlk
cy5oIGxpbnV4LTYuMTMuNS9kcml2ZXJzL2hpZC9oaWQtaWRzLmgKLS0tIGxpbnV4LTYuMTMuNS12
YW5pbGxhL2RyaXZlcnMvaGlkL2hpZC1pZHMuaAkyMDI1LTAzLTA0IDEwOjA0OjMyLjI1MjU0MTQ4
MyArMDIwMAorKysgbGludXgtNi4xMy41L2RyaXZlcnMvaGlkL2hpZC1pZHMuaAkyMDI1LTAzLTA0
IDExOjE4OjUyLjY4NDA5MzgzNiArMDIwMApAQCAtMTg0LDYgKzE4NCw4IEBACiAjZGVmaW5lIFVT
Ql9ERVZJQ0VfSURfQVBQTEVfSVJDT05UUk9MNAkweDgyNDIKICNkZWZpbmUgVVNCX0RFVklDRV9J
RF9BUFBMRV9JUkNPTlRST0w1CTB4ODI0MwogI2RlZmluZSBVU0JfREVWSUNFX0lEX0FQUExFX01B
R0lDX0tFWUJPQVJEXzIwMjEgICAweDAyOWMKKyNkZWZpbmUgVVNCX0RFVklDRV9JRF9BUFBMRV9N
QUdJQ19LRVlCT0FSRF8yMDI0ICAgICAgMHgwMzIwCisjZGVmaW5lIFVTQl9ERVZJQ0VfSURfQVBQ
TEVfTUFHSUNfS0VZQk9BUkRfMjAyNF9WMiAgIDB4MDMyMQogI2RlZmluZSBVU0JfREVWSUNFX0lE
X0FQUExFX01BR0lDX0tFWUJPQVJEX0ZJTkdFUlBSSU5UXzIwMjEgICAweDAyOWEKICNkZWZpbmUg
VVNCX0RFVklDRV9JRF9BUFBMRV9NQUdJQ19LRVlCT0FSRF9OVU1QQURfMjAyMSAgIDB4MDI5Zgog
I2RlZmluZSBVU0JfREVWSUNFX0lEX0FQUExFX1RPVUNIQkFSX0JBQ0tMSUdIVCAweDgxMDIK
--000000000000e0af96062f80eb3c--


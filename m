Return-Path: <linux-input+bounces-16996-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D2FD146CB
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 18:40:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5521D3012A8C
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 17:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63F2B37E301;
	Mon, 12 Jan 2026 17:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GDkYj3+G"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A03376BDD
	for <linux-input@vger.kernel.org>; Mon, 12 Jan 2026 17:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768239614; cv=none; b=GhVEMMvlm4cjwLtGe2Comis0ndQLBkWPDNfPq/oVamXpa8IVgsMp20mrgwHibGtFxzUyAmaotkavnbNoGtRRpWjpdzdU3KXMuuenhW1TK6fg7CLCvNIFhutDx8GZvcfMcKfFxfjqtphG0xx/ztQsPXLmP34wVXMp6sRTjIW6KqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768239614; c=relaxed/simple;
	bh=bWNt8XX+a1EExBXkcnhLkWphW1cwAsUON30o0t1HtEo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=j6Skhb32Ard805MX4Ie5o+0ANcZmwIGdHFAC317XrCWOTd1+CqcSeD5lCaGS+hsEAvrzKbbDh8EdVA4VuXADE6yL5AW1b3UjOkz/qtmPT2jjJdvuTa7k+h6vb+kVHI8rWVyxYK+kkbuz+nw/H1ydFrVuVjHISRgDgVOEzMXRemo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GDkYj3+G; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2af41f558f5so6981945eec.1
        for <linux-input@vger.kernel.org>; Mon, 12 Jan 2026 09:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768239610; x=1768844410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xEfzR2IMaUJ79aVMeAHSeF5WLoBzAAzr7Ul2pdFLEjU=;
        b=GDkYj3+GMSorx/eaULUQBhQYY35+EdAlXkW4K7NdIBEWd8uxXS9+lHRXoDGzBIW3E/
         RsYfFj11lydtT+zGsTXKejdd7/3uLTsnY6xvRn6jwm+QrsJsIUBXivOHBBNK84rnE2jy
         fra2RhJU8iveo8zKEkVq3cOKH/dLapI3W76KTQbnRSzguXcyrYOXg0wJwcRmeICvCB/7
         vA+CHzSGreeb5PwQKiRkbpDZVKkLs9l8I05v7VXW9CU3ZbRVKCFPNT7jzkcWJPWYmJpl
         F0xPf13PlURowuXVKZYgCYBJv48dlxnzy/ugqUQRgbBHK0/MWRfRNsb5JW2DRYHRIgyp
         EiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768239610; x=1768844410;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xEfzR2IMaUJ79aVMeAHSeF5WLoBzAAzr7Ul2pdFLEjU=;
        b=mGpKeod5348eCnOqMLHM/ytck5iLE2/oTDnx5hx+2S+o9CRqod9/M0Vkc1UqkS6CUw
         4bnV6VJ100aEig3g4+2LhLa7b+eRi3DAsLbM95calryFdP3kIEn6NsaM8U9fYzKHRQTh
         j1j1L4vv8+yezdeqRbi8j7KBArRcnfNb50fJSt3n95mT88b421A6xMJ8fFTZngd7zGwy
         f/q7uW9VR5lqAvPCf33TH+jkFIkqWewIe+p3aZTN5BG/ynzUufULb32yRsABEQKWf+7G
         6ayGSpR6JHJhZWuNgVRNAoc8qWOvljVjMrNvOqyBBhlTtzBEEqyeeiS0XVYEj+DD1Gm6
         KOmA==
X-Forwarded-Encrypted: i=1; AJvYcCWjjzUb8N64tfgZrWVcODkwnVN2ZMOQ7v8QYBRjhixvU1jjxDwDQdcReD6OaJ76W9vqtyG+EPwQXgVz6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAH0+LePvopK1MkJxkoh2VqLkQnwNgCy93LVtYiqOVhHCEaz2H
	LEo9GNdBFe/JIxWlNgVfuWbIRTtcjqGipgfJFdkS1qFzZN+3tvt29lri
X-Gm-Gg: AY/fxX4CaNCVr6b18ROzKqBk/v1yo9fwAm6WYhVWBcfC8w1AF9KcVZNGHAOkwfGf3bv
	aU5muhlJNJOAeoqJKYd16HHybEjBGPAryla5F39bSFtGLtMGRflLsK4AIX8239/FkOOiRDI7Y4K
	oYt+VcMD7JDINbB0Ho/AsZwohLZY/ynWeZ75IcOle8tEJ6Qo9Va+NxdGApYCcznFzM/rj8VU6H1
	nP4gfgxosgWFomx44WGDj5ttZPamiQ1mGBfo8cKPaScGc+wgh8yNpoOr4J/WAm9obstZnYKWs8U
	QuTBA6X1j0JCkbS1hVbyBhifbnBYKgGy+VbjhdFhaqrM8c77VfPGDljlkh9d0DcmhCxbktFhTXe
	fY+CtGy/fZNi9In7s5tqZhpa8zZcxX0X+joXiXwCA1ckt52KCdvqyTqnj8pP3ycQSqTr9TajYJD
	qFBcWJkLU+TSh728T97B6F1HZRQ2AI4WTPXYG7W8NhyRQixpJHLl1Wx4e6V8JwVbl6uukrLIi79
	pK4kqDDjg==
X-Google-Smtp-Source: AGHT+IHCTZtjyWlWk0cwrNDVQ+H3iM6fgz0CcfURU1LVPBZ+hluW6yquQuzFvxEgwtxB4odmjN+y5w==
X-Received: by 2002:a05:7301:8613:b0:2b0:4b5b:6820 with SMTP id 5a478bee46e88-2b17d2e3663mr11342670eec.26.1768239610022;
        Mon, 12 Jan 2026 09:40:10 -0800 (PST)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b170675076sm16683675eec.2.2026.01.12.09.40.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 09:40:09 -0800 (PST)
Date: Mon, 12 Jan 2026 09:40:09 -0800
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>
CC: Benjamin Tissoires <bentiss@kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_02/16=5D_HID=3A_hid-lenovo-go?=
 =?US-ASCII?Q?=3A_Add_Lenovo_Legion_Go_Series_HID_Driver?=
User-Agent: Thunderbird for Android
In-Reply-To: <0on4p9s6-7512-9408-49no-3292o86113r3@xreary.bet>
References: <20251229031753.581664-1-derekjohn.clark@gmail.com> <20251229031753.581664-3-derekjohn.clark@gmail.com> <0on4p9s6-7512-9408-49no-3292o86113r3@xreary.bet>
Message-ID: <6BB4F74A-F440-4F21-B094-62CFD18C599A@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On January 12, 2026 4:12:43 AM PST, Jiri Kosina <jikos@kernel=2Eorg> wrote:
>On Mon, 29 Dec 2025, Derek J=2E Clark wrote:
>
>> Adds initial framework for a new HID driver, hid-lenovo-go, along with
>> attributes that report the firmware and hardware version for each
>> component of the HID device, of which there are 4 parts: The MCU, the
>> transmission dongle, the left "handle" controller half, and the right
>> "handle" controller half=2E Each of these devices are provided an attri=
bute
>> group to contain its device specific attributes=2E Additionally, the to=
uchpad
>> device attributes are logically separated from the other components in
>> another attribute group=2E
>>=20
>> This driver primarily provides access to the configurable settings of t=
he
>> Lenovo Legion Go and Lenovo Legion Go 2 controllers running the latest
>> firmware=2E As previously noted, the Legion Go controllers recently had=
 a
>> firmware update[1] which switched from the original "SepentiaUSB" proto=
col
>> to a brand new protocol for the Go 2, primarily to ensure backwards and
>> forwards compatibility between the Go and Go 2 devices=2E As part of th=
at
>> update the PIDs for the controllers were changed, so there is no risk o=
f
>> this driver attaching to controller firmware that it doesn't support=2E
>>=20
>> Signed-off-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>> ---
>>  MAINTAINERS                 |   6 +
>>  drivers/hid/Kconfig         |  12 +
>>  drivers/hid/Makefile        |   1 +
>>  drivers/hid/hid-ids=2Eh       |   3 +
>>  drivers/hid/hid-lenovo-go=2Ec | 734 ++++++++++++++++++++++++++++++++++=
++
>>  5 files changed, 756 insertions(+)
>>  create mode 100644 drivers/hid/hid-lenovo-go=2Ec
>>=20
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 9ed6d11a7746=2E=2Eb5ad29d24e3e 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -14135,6 +14135,12 @@ L:	platform-driver-x86@vger=2Ekernel=2Eorg
>>  S:	Maintained
>>  F:	drivers/platform/x86/lenovo/wmi-hotkey-utilities=2Ec
>> =20
>> +LENOVO HID drivers
>> +M:	Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>> +L:	linux-input@vger=2Ekernel=2Eorg
>> +S:	Maintained
>> +F:	drivers/hid/hid-lenovo-go=2Ec
>
>Hi Derek,
>
>thanks for working on this=2E
>
>I am now almost finished with reviewing this pile and am planning to queu=
e=20
>it in hid=2Egit shortly, but I have a question regarding the MAINTAINERS=
=20
>entry above=2E
>
>The title claims support for all of Lenovo HID, but there is much more to=
=20
>it than drivers/hid/hid-lenovo-go=2Ec, specifically in hid-lenovo=2Ec=2E
>
>So either please make the title more specific (or claim the ownership of=
=20
>the whole Lenovo HID landscape indeed, fine by me, but the please reflect=
=20
>that in F: :) )=2E
>
>Thanks,
>

Hi Jiri

Sure, I've debated using LENOVO LEGION GO HID drivers and LENOVO GO HID dr=
ivers=2E Do you have a preference? The other drivers are pretty old and I d=
on't have any hardware that would use them so I'd prefer to keep them separ=
ate (though I'll acknowledge that they don't seem to have a MAINTAINERS ent=
ry)

I also need to fix the ABI docs, I accidentally added an extra + character=
 to every line in the patch for both=2E I'll update that too when I fix thi=
s=2E

Thanks,
Derek


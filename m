Return-Path: <linux-input+bounces-7122-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AB29932EA
	for <lists+linux-input@lfdr.de>; Mon,  7 Oct 2024 18:18:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A68701C22784
	for <lists+linux-input@lfdr.de>; Mon,  7 Oct 2024 16:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD7CE1D9323;
	Mon,  7 Oct 2024 16:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="VUnquY9M"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429871D434E;
	Mon,  7 Oct 2024 16:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728317879; cv=none; b=i0DlrvwDrAqGwsRF3BXWvtLP9kU5NtVS01AbV+AvG6gMhOI5fyVWDy6BCgIx6UCIDoZqP9CFz5227SyhCA1f5u5qZcO+cskSKl3hXmp19qnOxpR2TXXQUTGSj8h3W+lVbfUnM4e1S7hQtmOJL053o5s/jrapsLQ1z/Gu+YNsGRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728317879; c=relaxed/simple;
	bh=pAwrv/y5NT3G3VUR9WEeiKDGG4RLZNszvEX9MD5Ybc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=akx6QBAWAaqs1gz4ShN2DZOUEHzheN2UI4QEY9BKOgsqykxk/8Oa+PpM7SMdKuTDtwe/ZModv/k4zhf0Q/x2FOXF9aHzU9kECMN+25IWED3ShsQrvZrtlpawREXI4RmpxVDabq2wQCUM1WfdXTF4U+BE9eC3oihwCcaSyZhEgng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=VUnquY9M; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.96] (p5de457db.dip0.t-ipconnect.de [93.228.87.219])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id C72112FC004D;
	Mon,  7 Oct 2024 18:17:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1728317869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KXCO8nk9dKyl6+T9Ci1UYd9mcP4/XTE0/Kr6tzc5qDg=;
	b=VUnquY9MWox7I1OzpywCG2UbAbIvlqwLEvnewplFuE/POSjG2eswBZ7lU4XMRgz5Wd5+FS
	qRZyi9AMsPiLNAieVVp1WaZvRI2ia7zbwvLiaRQsuW/HiUBa/z19SMV49c1rE0V948kyda
	J9QRvcwYtFrOf9eZx1HplLEp8UU4LMQ=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <2392fa23-4823-4660-8b38-0f9dfe06c863@tuxedocomputers.com>
Date: Mon, 7 Oct 2024 18:17:48 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO NB04 devices
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, bentiss@kernel.org,
 dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
 lee@kernel.org, linux-input@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org,
 miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org, onitake@gmail.com,
 pavel@ucw.cz, cs@tuxedo.de, platform-driver-x86@vger.kernel.org
References: <20241001180658.76396-1-wse@tuxedocomputers.com>
 <20241001180658.76396-2-wse@tuxedocomputers.com>
 <bc3f5f2b-252e-0a66-df0f-f01197a5a17d@linux.intel.com>
 <fdfaaad5-59e7-4825-bc06-db44831ac741@tuxedocomputers.com>
 <49beebf1-db73-a3a1-3376-e1822ce2e569@linux.intel.com>
 <98883fb1-c895-4aad-842b-ed525d4c42f6@tuxedocomputers.com>
 <07e29712-4c33-efa2-c8c6-ae19e21376fa@linux.intel.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <07e29712-4c33-efa2-c8c6-ae19e21376fa@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Am 04.10.24 um 16:46 schrieb Ilpo Järvinen:
> On Fri, 4 Oct 2024, Werner Sembach wrote:
>> Am 03.10.24 um 12:54 schrieb Ilpo Järvinen:
>>> On Wed, 2 Oct 2024, Werner Sembach wrote:
>>>> Am 02.10.24 um 11:52 schrieb Ilpo Järvinen:
>>>>> On Tue, 1 Oct 2024, Werner Sembach wrote:
>>>>>
>>>>>> The TUXEDO Sirius 16 Gen1 and TUXEDO Sirius 16 Gen2 devices have a
>>>>>> per-key
>>>>>> controllable RGB keyboard backlight. The firmware API for it is
>>>>>> implemented
>>>>>> via WMI.
>>>>>>
>>>>>> To make the backlight userspace configurable this driver emulates a
>>>>>> LampArray HID device and translates the input from hidraw to the
>>>>>> corresponding WMI calls. This is a new approach as the leds subsystem
>>>>>> lacks
>>>>>> a suitable UAPI for per-key keyboard backlights, and like this no new
>>>>>> UAPI
>>>>>> needs to be established.
>>>>>>
>>>>>> v2: Integrated Armins feedback and fixed kernel test robot warnings.
>>>>>> v3: Fixed borked subject line of v2.
>>>>>> v4: Remove unrequired WMI mutex.
>>>>>>        Move device checking from probe to init.
>>>>>>        Fix device checking working exactly reverse as it should.
>>>>>>        Fix null pointer dereference because, hdev->driver_data !=
>>>>>> hdev->dev.driver_data.
>>>>>>
>>>>>> Co-developed-by: Christoffer Sandberg <cs@tuxedo.de>
>>>>>> Signed-off-by: Christoffer Sandberg <cs@tuxedo.de>
>>>>>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>>>>>> Link:
>>>>>> https://lore.kernel.org/all/1fb08a74-62c7-4d0c-ba5d-648e23082dcb@tuxedocomputers.com/
>>>>>> ---
>>>> That why i choose the rather generic names of just the input and output
>>>> length
>>>> because there is no semantic connection between the wmi methods in
>>>> tuxedo_nb04_wmi_8_b_in_80_b_out and tuxedo_nb04_wmi_496_b_in_80_b_out
>>>> respectively that would make for a good name.
>>> So the only valuable characters are prefix + 8/496/80 the rest doesn't
>>> really tell much despite all its characters :-). Details like which of the
>>> numbers is in/out and that the numbers are in bytes could IMO be left to
>>> struct's comment without loss of much information value.
>>>
>> tuxedo_nb04_wmi_8_80 kinda looks strange to me, what about
>> tuxedo_nb04_wmi_8_in_80_out? but that's on 4 chars shorter.
> Perhaps just tuxedo_nb04_wmi_8in_80out ?
ok
>
> I can see you like to use underscores a lot so I can understand if that
> feels a step too far :-) (no offence meant).
>


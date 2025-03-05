Return-Path: <linux-input+bounces-10564-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F224A4FF17
	for <lists+linux-input@lfdr.de>; Wed,  5 Mar 2025 13:56:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DD1418908B1
	for <lists+linux-input@lfdr.de>; Wed,  5 Mar 2025 12:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7438C245011;
	Wed,  5 Mar 2025 12:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UtUSxtwB"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFFC1EDA26
	for <linux-input@vger.kernel.org>; Wed,  5 Mar 2025 12:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741179389; cv=none; b=SBfiV5wyKnDgOUx34Dlp3SIdFzYbNe0ZPVmTm1sSrnoUeYwfCIzYX6UMkdK6FeTdzxYZEWuh2Tq2ExBmbcayVEOffA01wfI2yaRHeYbGJxEYvPQt9gBDALOk0DK2230fsfpoKYDhZBmddXGw8jIbJ3F7I6eGb9o4rcgNXGsCVBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741179389; c=relaxed/simple;
	bh=e1mwfxZUt3ptBte/jqIYvM3cOusxv8qa+gGvqR+6sII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sxNvovNLVzKL/0L5veopw0DvHLaju54KAgtzjD6cYuJvqFmsSPC5VWSLzM2RGjyThXFmhNxHe9d3qvIGF5aqJ23lfDbCQWHqqdEQpEdrAe8jvi5pFNpQROQYK8AQQza6GNSPD86eGDtwvQOM/Vg2PDiiOfKWmPfRy8bm31fH+Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UtUSxtwB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741179386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Za8i7LJ2q5ph41mgejRxdkDOeTZPIJR92M7/oekDxSE=;
	b=UtUSxtwBPSfYKEyiqtjE9cRrQhJuldeXzQlLcMSVtVA7dfVNQjSw4Ud8hZAZv4A7c0Fs4Y
	tF4YTg0mUMQ8dEdh3SA20KX7c65EIvRf6UD9o4i0khcc5UursdvtzPPyjfJTvHeK5XaoeQ
	5DYUUjQD95GN/6a/tVGweZFSG50dSvk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-320-xAuMGdo-NHWM8CTxs7L0cg-1; Wed, 05 Mar 2025 07:56:20 -0500
X-MC-Unique: xAuMGdo-NHWM8CTxs7L0cg-1
X-Mimecast-MFC-AGG-ID: xAuMGdo-NHWM8CTxs7L0cg_1741179379
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ab68fbe53a4so946743866b.2
        for <linux-input@vger.kernel.org>; Wed, 05 Mar 2025 04:56:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741179378; x=1741784178;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Za8i7LJ2q5ph41mgejRxdkDOeTZPIJR92M7/oekDxSE=;
        b=DTucIr9EUb3sWnZhVzub6pst9fX0iVqaEFZAZRiVhrVkNd3b8LDRRmBBGhyeTsOWHe
         VVhaY5MRj7G9jWm1fnvhkKKx3vwXzXvjMuxOPCptyyx3x+hpljD14eOtFzj0vSyUTyyU
         tSLkWmn/i0Xm7yXsfbEUBl28GcrCIG50Fx5DPstfzp0VZVuiaas41wYvHQKJ2nzLUrq/
         QFoE0cke0H9AtyBJWFoLkhNROMk7UmVmMVMUCZvo92sdu7Nawq2xYXODYwCwNXQpnDXL
         rjsyrA8B7zD8sINIrodJof7nEKBjFTYDwgW0FbGhRDNyyzxkmENwR4rhhSbPjavwiCFa
         qzeA==
X-Forwarded-Encrypted: i=1; AJvYcCXSARyPWtIX48xVa8SKrpOlfTlzrlMh0Dsz/K9TQ3a2HtcdkE0Nn5G/uA+w7nL9h5xPYRhCinXl2eWcRg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/56rYB9rmvGyZvk9J76jRHQdtiRfoQMZRiOoSFUNEhtPMDYni
	VeCEKQq5P2cL6csAEzzBb5mvUu6S/Qi/0s/rtEvV7jOp5vYQQdB04GvqGF+lpBALewkaYiR3yyZ
	PmTsdboaO2oXwZXBbCTf+VtpSb0qQM2Mg9jr06u5ZQpAdtQXQKf6TK7d9RGM4mbAmwD4Z
X-Gm-Gg: ASbGnctsu9OXM1naIsxxZFXu03cxzLE2nN+AgxvqBjsGnuvuhhlwHkSeSyUuvNA95th
	78yDNS5Na87u991cKfgzd1wt+VLmKc0XOraSMMB1oHB4E+lMRWoyv8mZVxu+22q/08Dm1S+ZDbe
	9wY+T0YaZ3YYodaD2ZCbgb6PVouIptpYXyuRX1czjV8aRYkMtm3Q2w8vcb+DjWZhEc+KrumefTK
	6vQKx3gJUTmhqW6V63wCNEW1e86GSCZjZk2RaTIDxaZK/vSswKDZNbneJKnGmLd+qSQ8UHZtSzM
	WFzDNiZWjh6GvD2atLTLW1+BdYlPx5NmCpGhSAgytDzJRjheUEe96HOPD1a1gk3mGChhVr6QN4a
	1O0MdPfuaZxdOXmrA9+oDxoCj9xa1d4P4FGkJnta178YCOm/v+9r1p9eA/wkCr3x7tQ==
X-Received: by 2002:a17:907:d27:b0:abf:4c82:22b1 with SMTP id a640c23a62f3a-ac20d92d645mr264906966b.32.1741179378492;
        Wed, 05 Mar 2025 04:56:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7FU069uMF1dnQAV6+DOZu+Ac8Fl/LVt/1+ht6q83IgFnbpvYl09QsqZR11ilEO2jA0VLHfg==
X-Received: by 2002:a17:907:d27:b0:abf:4c82:22b1 with SMTP id a640c23a62f3a-ac20d92d645mr264905466b.32.1741179378157;
        Wed, 05 Mar 2025 04:56:18 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac1fcc6f986sm239728266b.93.2025.03.05.04.56.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 04:56:17 -0800 (PST)
Message-ID: <44e18b80-8160-46a7-a891-de9014128d2e@redhat.com>
Date: Wed, 5 Mar 2025 13:56:16 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] Input: atkbd - map F21 key to support touchpad
 toggle keys
To: Werner Sembach <wse@tuxedocomputers.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: mario.limonciello@amd.com, ilpo.jarvinen@linux.intel.com,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250303190442.551961-1-wse@tuxedocomputers.com>
 <Z8f1EzASdCfa2h_7@google.com>
 <9f3e1a77-246d-4880-af99-dcbfc94a573f@tuxedocomputers.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <9f3e1a77-246d-4880-af99-dcbfc94a573f@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Werner,

On 5-Mar-25 1:18 PM, Werner Sembach wrote:
> Hi Dmitry,
> 
> Am 05.03.25 um 07:54 schrieb Dmitry Torokhov:
>> Hi Werner,
>>
>> On Mon, Mar 03, 2025 at 08:04:34PM +0100, Werner Sembach wrote:
>>> In the default xkeyboard-config used by both X11 and wayland touchpad
>>> toggle is assigned to F21.
>> We have dedicated KEY_TOUCHPAD_TOGGLE that is being used by several
>> platform drivers:
>>
>> dtor@dtor-ws:~/kernel/work $ git grep -l KEY_TOUCHPAD_TOGGLE --
>> drivers/platform/x86/
>> drivers/platform/x86/acer-wmi.c
>> drivers/platform/x86/asus-laptop.c
>> drivers/platform/x86/asus-nb-wmi.c
>> drivers/platform/x86/eeepc-wmi.c
>> drivers/platform/x86/fujitsu-laptop.c
>> drivers/platform/x86/ideapad-laptop.c
>> drivers/platform/x86/msi-wmi.c
>> drivers/platform/x86/toshiba_acpi.c
>>
>> Instead of piling on F21 hacks we should be using it.
> Afaik KEY_TOUCHPAD_TOGGLE is not implemented in userspace, but a patch for xkeboard-configs could probably be enough to change that ... have to look into it.

Quoting from the other reply in this thread I just send
(our email crossed):

Werner, we were using F21 in the past because we could not use evdev
keycodes >= 248 (256 - 8 modifier keys) because of Xorg limitations.

But recently the mapping of things like KEY_TOUCHPAD_TOGGLE /
KEY_TOUCHPAD_ON / KEY_TOUCHPAD_OFF to F2x keys has been moved to
xorg-x11-drv-libinput which gets the full range key-codes from
libinput and can then do this mapping before passing the keys
to the X-server.

So it is no longer necessary to use KEY_F21 and even in the past
we used to do the mapping in udev / hwdb rules not in the kernel
in the kernel we've always (with a few exceptions which are my
fault) used KEY_TOUCHPAD_TOGGLE as that is the correct keycode.

Regards,

Hans




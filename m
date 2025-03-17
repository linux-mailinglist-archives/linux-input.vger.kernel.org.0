Return-Path: <linux-input+bounces-10887-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5472EA64DF6
	for <lists+linux-input@lfdr.de>; Mon, 17 Mar 2025 13:07:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13D241888823
	for <lists+linux-input@lfdr.de>; Mon, 17 Mar 2025 12:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CB71239068;
	Mon, 17 Mar 2025 12:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a+jFk3IJ"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35F9238154
	for <linux-input@vger.kernel.org>; Mon, 17 Mar 2025 12:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742213210; cv=none; b=haHkPHc+sIAmJd+T7QogB5vCQ648vT/TXp+j04WGx976w80+LAY0CDlfsIvpQHvkRbRif0iQAuiSjqguO9NrR3Hay+8nUqXYhJr+W3kCVs/g5Cyda8xJu5Y7xem1j2GWEkFRIYx+dB74Mk9Q199bM/96Bb6fJgGhAn1ebgqa9EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742213210; c=relaxed/simple;
	bh=OdhP8xqEt2iM7IROoka4dd5M0pkY/P6CneVm+XNjuY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mb8ytMGvYPG77pgsHVBHymMRAuruF82dMsV6fMeR5m0uyMfXQF16vkNxI0Cz3SDIv0oeqj0FxDABW4/hM/xwwVMRe7mgJFBiCggcR2Jy9oe0QDAP0mYfOj+PSTEqQPABEnrNUApDPpvsi/gzJUG6rhmgkV/2RYp7dZJAhnDqYds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a+jFk3IJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742213207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FsJOBNIkT+IrsuxSgC3fs8kWA8Vn7b/lsGkqVTldQws=;
	b=a+jFk3IJnDDQAeGwnMwMDTVrjBvacUiHnNFsSrYCzRbTuQ7zuL3/frxC3rY9V+a0L7H1OR
	e5TAACQxx6yWRcIgnO40h60sgEf951R6y940oeLBcdOz7n6/mAvZW0rYGN8DvKiDZ5ZmFe
	vqKcq2lpjEYRmfhRVEo/HJPy57lMjMQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-vbArU4lyOs6Ej7dkx_zb4A-1; Mon, 17 Mar 2025 08:06:45 -0400
X-MC-Unique: vbArU4lyOs6Ej7dkx_zb4A-1
X-Mimecast-MFC-AGG-ID: vbArU4lyOs6Ej7dkx_zb4A_1742213204
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5e5be5ec846so3882153a12.2
        for <linux-input@vger.kernel.org>; Mon, 17 Mar 2025 05:06:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742213204; x=1742818004;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FsJOBNIkT+IrsuxSgC3fs8kWA8Vn7b/lsGkqVTldQws=;
        b=TivuNb/o33ToSgF2k4O8tbloCV5tKNCbcPmIGDQHDQUcloAHHeJ4P85+Vpiz9yq0CM
         WCzkgZCw5tNmVpnyw33nGHkeO9HTG2D4y7SkrwQ8FsOk0MH8NkPNX9XwA11qNYquoW++
         BAlxe1dIzJy6TOI5oGHCw/CdG4Tfro1THQFjQgKs7jkmYdcwbmQ6VrmyV346QEQwcEti
         AxbDN4nHqBjIUO5p7kmMo+h4JxH1vTA/9/1mcFZiq1tZpk/b5MbHE7je+maghWNPk1L5
         Ii3p+hz3jEl6rZwxim/H9Af2KxtyX2BHFlVXrs4NthEA5fdtk1egfz50EfsGFCeepnao
         DecQ==
X-Gm-Message-State: AOJu0Yz3mQNykW3c1LgbyMV/VVPlXn2WaxL/ubsrlXuDODQ2Wgqks/QE
	KT9SuFrkeZ2Kcp69NdYorynYU/YcTqDDFgLr4HOgI54b6cQjt1TuQpP1dWpWh/mbZd7ML3HFzK1
	ibrYEgIOBXN1cqt1G/aItwA31ToBle0SfGEha6TpWaUKTbPEAAIi8u23Mz2U8
X-Gm-Gg: ASbGncu62aFVSqMViB3kEf5WibIsgK6f73+28Dyb5Z6/fQjQNKrcaUDqENjn+Lhz38h
	2xXXM9ofKCuMS7LR8JEizDKerg0Bc8p0fuSeMK4xweT441Q9d1GUSJepzaiDC2UtNrgfvEolIQ5
	GMlTswzY5syGNh+jW5K4TKIGR+cfDr/66bJFDdQ/liTEllNN4yEC7V38oZkwoYQTyu+cSHmdFvt
	yqvgFGaD+3mWXUekTT4sQiCQivTtojHJEYhheGvr3WgWRHNElF0OyGXl5v2+W8cxCb5YF/hQscI
	XyrIhusk2nn6XXj1MlQ=
X-Received: by 2002:a05:6402:1e88:b0:5e5:dea5:3eb2 with SMTP id 4fb4d7f45d1cf-5e89fa27ff5mr13019754a12.11.1742213204082;
        Mon, 17 Mar 2025 05:06:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmQMtOckCF+PJyW0evnswjVRpHzbUIJWSKU6Yez1QrIPqUxHyXtbiMkkXYeWU68iPbIwfbAA==
X-Received: by 2002:a05:6402:1e88:b0:5e5:dea5:3eb2 with SMTP id 4fb4d7f45d1cf-5e89fa27ff5mr13019703a12.11.1742213203664;
        Mon, 17 Mar 2025 05:06:43 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e81692e6d4sm5761290a12.9.2025.03.17.05.06.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 05:06:43 -0700 (PDT)
Message-ID: <45fff318-7925-4328-9dca-999c00e271d2@redhat.com>
Date: Mon, 17 Mar 2025 13:06:41 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] Input: atkbd - Correctly map F13 - F24
To: Werner Sembach <wse@tuxedocomputers.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250311180643.1107430-1-wse@tuxedocomputers.com>
 <20250311180643.1107430-2-wse@tuxedocomputers.com>
 <83ea44f6-c0ad-4cb0-a16e-dd4fa17b63c7@tuxedocomputers.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <83ea44f6-c0ad-4cb0-a16e-dd4fa17b63c7@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11-Mar-25 19:10, Werner Sembach wrote:
> Hi Hans, Hi Dimitry,
> 
> resending this too on the v2 to not cause confusion:
> 
> Regarding remapping KEY_ZENKAKUHANKAKU to KEY_TOUCHPAD_TOGGLE:
> 
> Am 11.03.25 um 19:06 schrieb Werner Sembach:
>> Currently only F23 is correctly mapped for PS/2 keyboards.
>>
>> Following to this table:
>> https://download.microsoft.com/download/1/6/1/161ba512-40e2-4cc9-843a-923143f3456c/translate.pdf
>>
>> - F24 and Zenkaku/Hankaku share the same scancode, but since in real world
>> Zenkaku/Hankaku keys seem to just use the tilde scancode, this patch binds the
>> scancode to F24. Note that on userspace side the KEY_ZENKAKUHANKAKU keycode is
>> currently not bound in xkeyboard-config, so it is (mostly*) unused anyway.
> 
> I think what the firmware vendor actually wanted to do was to send ctrl+super+f24 upon touchpad toggle. This would somewhat fall in line with, for example, the copilot key being implemented as shift+super+f23.

I agree that that seems to be the intent.

> Following this, my suggestion is to do this remapping and handle the rest in xkeyboard-config

xkeyboard config already contains mappings for F13 - F18 and F20-F23 in
/usr/share/X11/xkb/symbols/inet

So all that needs to happen there is map FK19 -> F19 and FK24 -> F24.

And then teach KDE + GNOME that ctrl+super+f24 means touchpad-toggle.

We could maybe get away with also dropping the weird mappings for FK13 - FK18
and map those straight to F13 - F18, but we need the special mappings
for F20 - F23 to stay in place to not break stuff.

Regards,

Hans




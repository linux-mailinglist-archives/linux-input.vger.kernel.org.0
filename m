Return-Path: <linux-input+bounces-10340-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 174CAA43EE7
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 13:11:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E07463A3095
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 12:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4904B267F55;
	Tue, 25 Feb 2025 12:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ak7zEq7c"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EE5267B98
	for <linux-input@vger.kernel.org>; Tue, 25 Feb 2025 12:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740485350; cv=none; b=k5FprCOdX8L5cA9hV7QsNA+o2LxBsTBhW4fE9IL8OodVW7j0bhOAOnooRax2Lt6oatuxVTdbB6zAVZL02xmMG3ID91YXULlch0c0yBpb7jyz9qVPfYdWR/NEipXNnBVWaz+YFGzQs31SDvZfmtr4fn/thtYefJ6YJKm/dyGVEdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740485350; c=relaxed/simple;
	bh=/bHMF+VqAm3mXiDy/c+NSnUieIygySTPgyaXzjzK+SQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jGIAP0+oyicvyF+JmWX7a2VNOiJUh3FiuD6H+UPa53vMmWZN6LTpB0TW4731D/y9V+QANC+PSSUbSOB/wzyxpF85F/g7yrHZ5h4v6RpXB2P964sV7P/lq+d+YmAxXeRY25JPYmkauzrELyaI+Ykgvdz4MArTaSEJBzHsAWu8Dhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ak7zEq7c; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740485347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R9dFANPP4pAshr+nYJnMq+hckSzRgNmjIswd4al9xQk=;
	b=Ak7zEq7cMOshBLRULFfXtjXo9zdDcvTpEWpl4EhimjJN2rg8OmGd96ro93hoNbGa+Z7JPc
	e7OGye/EUCsrphvePnepuMCXfw6AGqjTyzzlUL5hiPwfiAXfD+mM3iV7mf+ngfeJBZizi4
	yTi8ltXpcqDllrApuTe4mbjuYSbE/VQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-DlHQDpeDOomwM4v6X_pKZQ-1; Tue, 25 Feb 2025 07:09:06 -0500
X-MC-Unique: DlHQDpeDOomwM4v6X_pKZQ-1
X-Mimecast-MFC-AGG-ID: DlHQDpeDOomwM4v6X_pKZQ_1740485345
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-abbe5ac36a9so636299966b.2
        for <linux-input@vger.kernel.org>; Tue, 25 Feb 2025 04:09:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740485344; x=1741090144;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R9dFANPP4pAshr+nYJnMq+hckSzRgNmjIswd4al9xQk=;
        b=PfMOf1qH5y2Ai1ou9qaqsxg8vexsMMfFbrNuIUDK4q4kHy0juAEjsTzB5KL95eBQQ6
         hX4Rih/n7clCKrQ+a25iw/N9wDLcUBMt1D0VWwcfqBTXVCDfWRKaQ2ApmX94qOhR5uqj
         +8b3dH8jfPBu/QaNJb9w/oYgDDfsNF8P4RhUMyXKSU8KwW6HdV8BalMxMEbD3JzsA8ei
         1ez1cDh/clDzyR7EfS0Yj7yu/hW2Y2B3q1UdLu6d0+pz21y5aRHSZZqdnj4ZbUxdHiHd
         NMA4gjdpM5OiVEMzw4qXfXLXyUzmV+Rig4FIhGCiMsSFmEG3PoxPXhWWsW00EFbZZZqJ
         T/oQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOxEdkxCCrGuYguuOw9LgNuo377jFcLIVpnYbMFw3iMO97V6FBaBkl2b6DPG76DaFioWyHhS7zqVjL9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwByOdjv/K/PoQSRBnqY/1sXeNu4O6HRgMc3JDvdcKLmuvrHKfe
	yoL9mMDR+aZiUWqSLvK8oC2d6oeL4zJXQvTXHvz9vB05bpEEVWNAlNHpMRHGa1XjxP8Pe9DXjlB
	m5/pRg8+ZK/dDOdMYE1DLqk1ADYl0wwWlNOXFjfcJWlBOXGBWyEdm03d+nC1+1KyHtMaK
X-Gm-Gg: ASbGncvaO0TUb5g3l3jXwRaeSkD+gtz1/fo/5G8l/8E9wGdmSFT14nn72z19Sy5BIDU
	LzkxM8JMTPmLmJfmPZ36D4agJd+ZA42SeIDsO+WCSFnRKNz2jcGYJJ/iNX2/oKIYw+C7GkLlkoC
	6EkS+LBObnpgxGP3RGknLiTYqUwmAHo+ICU2X8/whSsaFRPLhHnxiXXVksXIzoSVpmSZzocFfra
	zw3gYz1Qb0Bnuqti8UPa+QY0Q6KkRUhI7Moogk+Dcsltddjqh6vAq7u/ymQU0k5wBptciyuq3FD
	chqhoRD/YeChOJFz+m+r26i9AQAyO8HPo/TTA358kPCI48SAqaYoY4jY3kwZAPPLeBx9Sxk/K00
	QnCgn8Q2iBSzVUataCMJ6UvaFgkTOBJ9ocS2Cu+nFPTw1hUd6CFMkFetZ3OlA6qMr9A==
X-Received: by 2002:a17:907:8692:b0:abe:cde3:aae2 with SMTP id a640c23a62f3a-abecde46455mr416867366b.44.1740485344024;
        Tue, 25 Feb 2025 04:09:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IERbNL3SiexVOR9DKHPeYekUBMbVmBKTexIXmQRAzXrRMgfAbLIL6d20GsjrH+tXJ22hRzmPQ==
X-Received: by 2002:a17:907:8692:b0:abe:cde3:aae2 with SMTP id a640c23a62f3a-abecde46455mr416864566b.44.1740485343619;
        Tue, 25 Feb 2025 04:09:03 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed2057281sm129705766b.155.2025.02.25.04.09.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 04:09:02 -0800 (PST)
Message-ID: <8c7b5560-27d0-42bc-8f25-0797500fb889@redhat.com>
Date: Tue, 25 Feb 2025 13:09:01 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [QUESTION] Plans for GDIX1003 Support in Goodix Touchscreen
 Driver
To: Weikang Guo <guoweikang.kernel@gmail.com>,
 Bastien Nocera <hadess@hadess.net>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
References: <CAOm6qnnhR9++REgtjhZpqNXkBbBAZsGAY8Oy89cXUF9S=Vy-9Q@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAOm6qnnhR9++REgtjhZpqNXkBbBAZsGAY8Oy89cXUF9S=Vy-9Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi WeiKang,

On 25-Feb-25 3:04 AM, Weikang Guo wrote:
> Hi Bastien, Hans, Dmitry,
> 
> I am currently working on the Ayaneo Flip DS device, which I installed Kali
> Linux with kernel version 6.8.11-amd. This device has two touchscreens,
> but only one is functional. After investigating, I found that the second
> touchscreen has the device ID GDIX1003(confirmed by exporting the results
> through acpidump), and upon comparing with the current driver, I noticed
> that only GDIX1001, GDIX1002, and GDX9110 are supported.
> 
> I would like to inquire about the following:
> 
> Is there any ongoing development or plans to add support for the GDIX1003
> touchscreen in the Goodix driver?
> 
> Are there any patches or workarounds currently being developed or available
> to support this device?
> 
> I have also reviewed the ACPI description and can provide the details if
> needed. Any guidance or updates on this would be greatly appreciated.

I think this might just work with the existing goodix driver, just
add the new GDIX1003 HID to the goodix_acpi_match table:

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index a3e8a51c9144..4b497540ed2d 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -1519,6 +1519,7 @@ MODULE_DEVICE_TABLE(i2c, goodix_ts_id);
 static const struct acpi_device_id goodix_acpi_match[] = {
 	{ "GDIX1001", 0 },
 	{ "GDIX1002", 0 },
+	{ "GDIX1003", 0 },
 	{ "GDX9110", 0 },
 	{ }
 };

Note I'm not sure this will work, but is worth a try.

Also please run:

sudo acpidump -o acpidump.txt

and send me a private (off-list) email with acpidump.txt
attached,

Regards,

Hans



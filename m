Return-Path: <linux-input+bounces-11141-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF03A6DBE2
	for <lists+linux-input@lfdr.de>; Mon, 24 Mar 2025 14:44:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C98D03AF337
	for <lists+linux-input@lfdr.de>; Mon, 24 Mar 2025 13:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D532019C569;
	Mon, 24 Mar 2025 13:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MEmU3NWS"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0ED25E83F
	for <linux-input@vger.kernel.org>; Mon, 24 Mar 2025 13:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742823887; cv=none; b=MvdwFq1KvWfW8wigp0kEZiWnnkDEWqdsnk6Pr478URX8QUiXaaA/sARn7ualaOOemMdSr8jjzkGktihaORs/814Topon1WRikEaHycTqYha5ZwsD4PcYfufE45ZnkCidDC0bdtKhCAg1mK/Z6cpmzeYO7tfELOvWoBLWyCErXNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742823887; c=relaxed/simple;
	bh=BtMq1Phgzz1gfELJi9kgaZ1HoCwZbkFJI9WE7iNpY5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ki3RXos3sftzS7mm/M+QQD6lW0wXs9h1YfqPzv2OtRFlDYUEv6xt3RN1Zx0v5UV6T4330cK+msWafiKTXddTWyhbTBXK5brS0KvveRzgL5+X4cI+Vc2l8M6WP6fcmpV6RgJ3n9aaYri//xYyBEd3fm/cCkAaSQEjpzltqJo6H/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MEmU3NWS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742823884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/4vq0NadaspBq1AOLNTGTecjRXXfOaPKj2bY8Ky82FU=;
	b=MEmU3NWSqSrV0tN3p1eM8iCHNYyWHARkzqKis/rppYMQOwhCF0gQOpNl3c2kVe98Re7PjC
	0iIafRLbC3oQvkdILznzGICiuE7uysB9gqnTEUsefjKti3yYA46nqsxGzjuRb6AaL0d1lg
	+7ugopQGevoTN69cWryhJcu+SJ5JXkA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-10-nRU7oQbqOf6IhTJJ3akycw-1; Mon, 24 Mar 2025 09:44:43 -0400
X-MC-Unique: nRU7oQbqOf6IhTJJ3akycw-1
X-Mimecast-MFC-AGG-ID: nRU7oQbqOf6IhTJJ3akycw_1742823882
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-391459c0395so1954498f8f.2
        for <linux-input@vger.kernel.org>; Mon, 24 Mar 2025 06:44:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742823882; x=1743428682;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/4vq0NadaspBq1AOLNTGTecjRXXfOaPKj2bY8Ky82FU=;
        b=XviBLfXwOSIAsf8ZPPsQlkzjw6Bc/NErgleM6YP5qmt79XVjf7Ai0kZ7Hus95Tedg6
         yarjw5sWA7UzRmdxkrTEQzf1FvRMiyBy6t6UGFetTJULqHuBsR9RHoYvBhaFsLUdHtJO
         yqXcVXpKZAZnViGxiRe/rAm2J9gxypucIjjfmR4p6RbfpHkiM+NwmOVbtmxrZIhQ6Y5t
         FNaVaOgC/HKN3nlx+nfkQQmnP1wVMLYNOdSJtPdKHmxgXRtmnWAfcdDzRONzyCjJ5Yhj
         H28tWyEdjLCtJcuRSonmPx0PQPZMrBKkoyaTmSGO9lK2ucDr51AVrPqHF3DtFW1AN/JQ
         4jpw==
X-Gm-Message-State: AOJu0YydtnbMx0Emzyh9ogNZOZvhXWkI0kNLAmxvIQclA8t4+E2PBUxj
	c2V1nvXkzClC7hGqkMDE7xJUg56n53Z52+Vwh7aCoPX4wKc2E4jmfcP1OsIDiGaYnrR7HEVkSgx
	jbdF/KYuM1hyytd5rW+KzGJtKtylL+GwkDtH1+MYva2Mqc2C5fdG764UgkrqsQg/fpAZA
X-Gm-Gg: ASbGncs3jWehP7M9GoPbgscMLpSCry5CeZpqhjENiAXa+l02tRAodsWbgmAg6KLYlDs
	KOSPHl1IL+HEBoje2b+W0eCAyYStumwj5+wGk0kL5l6g4LbNSsePIOC3C6dkAck0u5Y8/0UAcB7
	PBuEDhyUzZQKfs8JuEOGoxy14N4AjhE3oQ5/pvzrVoIDw5xUjsFGgGP7qpWaIfMHdGbHmcjG/0G
	nbFSQhmQVBHo4leYAD0eedDmXskEtvl3jwxDgGKklwmo0dY7ewfjzdw/J9NUglnb7JTMgV6e2Y4
	HNEg2kCooleDrP0GiPc=
X-Received: by 2002:a5d:6d81:0:b0:391:29c0:83f5 with SMTP id ffacd0b85a97d-3997f94da3bmr11194861f8f.44.1742823881639;
        Mon, 24 Mar 2025 06:44:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgw0drHdor6mvj8mR7CwDju9RU62eeFdbuO0TW1VlKbC6c69/2vjQASLd41yFppbGB6ptblQ==
X-Received: by 2002:a5d:6d81:0:b0:391:29c0:83f5 with SMTP id ffacd0b85a97d-3997f94da3bmr11194840f8f.44.1742823881204;
        Mon, 24 Mar 2025 06:44:41 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9b3ff7sm10856367f8f.48.2025.03.24.06.44.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 06:44:40 -0700 (PDT)
Message-ID: <ff25f60f-4dd3-4cae-94c5-c6e1ffeffd5f@redhat.com>
Date: Mon, 24 Mar 2025 14:44:40 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Goodix Drive issue
To: Henry Isaac <henry_isaac@live.com>
Cc: linux-input <linux-input@vger.kernel.org>
References: <AM9PR03MB77126C238AE6CD781F15867BEDA42@AM9PR03MB7712.eurprd03.prod.outlook.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <AM9PR03MB77126C238AE6CD781F15867BEDA42@AM9PR03MB7712.eurprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 24-Mar-25 14:32, Henry Isaac wrote:
> Hello Hans 
> 
> I meant I believe there are more devices listed in dsmeg.txt but I may be wrong!

Ah I see. I did not notice any extra devices, but I haven't looked closely.

> That's a shame! In the BIOS there is 5 options for the touchscreen but the only one that works is 'Goodix GXTP7386' within windows. The rest are unresponsive. Both Windows and Linux.
> 
> Is it possible the driver just doesn't exist for this display or the kernal is failing to see the display is touch screen at all? 

I'm pretty sure it is just an I2C HID touchscreen, so things should work,
but for some reason the touchscreen is not responding to i2c communications.

There might be a bug in the i2c controller driver under Linux, or it might
be that some magic ACPI poke is needed somewhere to enable the touchscreen.

> I'm wondering if I try Fedora and redo all the steps just incase I installed the wrong utils along the way?

I think it is very unlikely that you'll get different results under Fedora.

Regards,

Hans




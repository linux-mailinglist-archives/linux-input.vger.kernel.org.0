Return-Path: <linux-input+bounces-12603-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18954AC5BC0
	for <lists+linux-input@lfdr.de>; Tue, 27 May 2025 23:02:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9AEA3B6809
	for <lists+linux-input@lfdr.de>; Tue, 27 May 2025 21:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C38A207A27;
	Tue, 27 May 2025 21:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pp7NlkO4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2976016EB7C;
	Tue, 27 May 2025 21:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748379738; cv=none; b=MzY+7Cc6ZVXQF1o8FmZrRmGaGKmn3Fa01RDXuS6G9BSdddkazXK7Z7piOeaJrPDv584FomUZUd8BMu/JBMOrrl2INyBGUbAFP9JJgp0IyjkAyxgfyPfG79OWhOTrm3iCPcEE2TOdXHNiwHdrgkPrOXKpbd41bOuIIqVDBm6B7Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748379738; c=relaxed/simple;
	bh=V40s5P10aUCH3HIVC2HNHSexXdvIT3EiOCOMr2U6Xv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kK12huEWeKTfaTgtwvXGfnIYzui/lkopItADjmHND+2FbCLBxsog6xqCf63XmOmxQiaKJVIVcDq7S+BiJMe0B0xDt70Lb5XTU8Xgup8pXAO5+gO3T9t/PO1LxsYpdsrurC28X6Bh2i92pAtYh+tPXBnOpAG6ONeUPFRU7u3jfCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pp7NlkO4; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b0db0b6a677so2668839a12.2;
        Tue, 27 May 2025 14:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748379736; x=1748984536; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q/8gJTs/s39iJKQwcXQ04Ed64htlV0Xkd23Q2UgmZ5o=;
        b=Pp7NlkO4MRKoAQWnZgn8W8ITAH2YEEeVatLTlgC/21vTk1TdQYExHv+fUtPmhPdbUk
         2ywWV5xpoNgek4jdH8sf3PKof93GzTWeTmE5AtGMIEROysVoF0QVvYIfzSNqmW1nswh2
         MHH7piDPDTDuBb+HW40ZiM4BR432bcsj7jKB/F4qhHCO7V27GhTJiAC+XRpIbepjRFmn
         TGK8Wxh/OGfUG3lLdLaYz333Wreu0v/5yyk0Q8ExJEhvsBGhsXQQtW2T5CgY2L4W2/gT
         M2nEJ7VxQOmjdu2F6/nBGE3UQRCXq6Ul4plhFxm3J6+IqKqcKTNcxyBwIopJ9rN8b/u/
         Vifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748379736; x=1748984536;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/8gJTs/s39iJKQwcXQ04Ed64htlV0Xkd23Q2UgmZ5o=;
        b=oLWDC1kEXpI/0PyFTVFzs1AlBlMTYoXGsWFIKJnIEpUt4K92q+j1cQHxud1++16ZVD
         7TpvfPix1HsNsdxpE6+HQTzf9MOEMJ4BKrRXTAD3bSlb8jx+XZSdT6cQYyuJ2acDgWS3
         j4JJHkYTuMFSjljYa9+SuaJ/gShbZZ4v48yQ3S2Uxukb/UAvEvQIMuPS5qXPAlqBKArX
         TJMa/lFrvWIby5mhL7djmi4w5+1F8RLa4IgTaDHp9M7CPlpmpJ06EbuyWZOejma/TfuH
         eYbKDZoXS08iEqzX4EMVxlmPR/WlYQKRoBZvbgxqeXtgBDkPcgWEEXTdMs5/XfltM5/b
         GWeg==
X-Forwarded-Encrypted: i=1; AJvYcCUalwWhpWsZW2LnCyJREpKWqEM+u+dGeD6roGq0b0Uo1eyfeG7dC9kHmmELPhK+FlYI08V1Q4Ly9ddeZmw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdDZW+aS7Coo6WfzDAmBIZQGeGFUaer7cldGnyVepGOPi9DtZv
	yXggGMKK8VcTCUTqkCo3c84jzASvgSrRq4q0AYObfs5YEksB1K4MMVo/Kp+0Jw==
X-Gm-Gg: ASbGncuySaOgI8JmPalOgZOwlIXoIkV8ZDUtBGPK2Iljg60kBfwxRgg8uIghzmhSLeV
	cu4Vd0FMPFIPmI2AMBfmAX2XdICOE/ktwyIqcBS90MIp7gYT5pW+LFYjQUL9lvWXHGXb4OaMwEQ
	zuvSCACiTxVlOjTWpNMhdHHaRjpUyCfdmhHHic+PDoZrMmEjCWY6tk8aZBgP5f1pjKrH7UmK0Es
	cWT7gYXDG1FOGvaPSiPOHeUuvjokn8BsAHov62WuvcoyR+rHJZCXG4tYW/rA5yAT2wO0zbozHHx
	TLh97K+0TLndVRNRfeMs8q7iQZx4F1+1UFWpFPFJ8FG8mPHjrU+D
X-Google-Smtp-Source: AGHT+IHjAifkKP8ETl6g3EX99KwuqWzfU6ZwlnmFkjLT5UAfcHuHyF27eoGiNt5JcJ5jGSETKmeGUg==
X-Received: by 2002:a17:90b:1d51:b0:30e:9aa2:6d34 with SMTP id 98e67ed59e1d1-3110efce72fmr26906299a91.0.1748379736054;
        Tue, 27 May 2025 14:02:16 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:234b:b801:3ed0:528a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-311e3da62d2sm5411a91.27.2025.05.27.14.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 14:02:15 -0700 (PDT)
Date: Tue, 27 May 2025 14:02:13 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Xianying Wang <wangxianying546@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] general protection fault in input_unregister_device
Message-ID: <j3gqh3iv7hsanemh3ctsrzcd3hljhsmdwe65vrnsjrygsz5dzx@7wvtrimqooim>
References: <CAOU40uDDL9-ivR=8nx67T9_j+1+2dCXNyBUqFvOPyv0cpPr5Yg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOU40uDDL9-ivR=8nx67T9_j+1+2dCXNyBUqFvOPyv0cpPr5Yg@mail.gmail.com>

Hi Xianying,

On Tue, May 27, 2025 at 04:21:40PM +0800, Xianying Wang wrote:
> Hi,
> 
> I discovered a kernel crash described as "general protection fault in
> input_unregister_device." The crash occurs in the input subsystem,
> specifically in the function input_unregister_device
> (drivers/input/input.c:2500), due to dereferencing a non-canonical
> address, resulting in a general protection fault.
> 
> According to the crash report, the faulting address is
> 0xdffffc00000000a4, which corresponds to a KASAN shadow memory region.
> The crash is triggered when mac_hid_toggle_emumouse calls
> mac_hid_stop_emulation, which in turn invokes
> mac_hid_destroy_emumouse, eventually leading to a call to
> input_unregister_device with an invalid or uninitialized input_dev
> pointer.
> 
> The report indicates that a corrupted or NULL input_dev structure was
> passed into input_unregister_device, possibly due to a use-after-free,
> double unregister, or incomplete initialization in the emumouse path
> in mac_hid.
> 
> This can be reproduced on:
> 
> HEAD commit:
> 
> commit adc218676eef25575469234709c2d87185ca223a
> 
> report: https://pastebin.com/raw/4TeX6E8M
> 
> console output : https://pastebin.com/raw/ZE2AZ1Gq
> 
> kernel config : https://pastebin.com/raw/BpCtvUt2
> 
> C reproducer :
> 
> part1：https://pastebin.com/raw/jhU9v99k
> 
> part2：https://pastebin.com/raw/dcaKCHZ1
> 
> part3：https://pastebin.com/raw/CzgGBb7C
> 
> part4：https://pastebin.com/raw/MnwtYcjd
> 
> part5：https://pastebin.com/raw/VE8xNmHT

Could you try to trim the reproducer to something more manageable? There
are really too many things going on to make sense of it...

I guess we are ending calling mac_hid_stop_emulation() with NULL input
device, but I can;t see how this happens unless we manage to overwrite
sysctl table memory with some garbae earlier....

Thanks.

-- 
Dmitry


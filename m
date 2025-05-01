Return-Path: <linux-input+bounces-12089-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F06A7AA59D8
	for <lists+linux-input@lfdr.de>; Thu,  1 May 2025 05:03:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B33CE9C5D51
	for <lists+linux-input@lfdr.de>; Thu,  1 May 2025 03:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F8FA1C173C;
	Thu,  1 May 2025 03:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efMSRc8B"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9380679C0;
	Thu,  1 May 2025 03:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746068598; cv=none; b=uXCBbmqrD6Qpgt+Utl+9yX5wfCR0Qqk9aaFP2xEbjHFkD+uJX0aK/KPJCoX9b2LZhbk6diL33E1QF6teE4016j5tT7Ts0bb06TGRu0Q8wz0MM+i2CxaCPfQGGjeBzTjZ9QGnatTpvhG5+1F08o+rt7lVosFETRARI7nJ+dW0JPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746068598; c=relaxed/simple;
	bh=pjHQcC8GoLoOTnFehy2NUwcgXOvGeC5LBmU/rWw3hdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lyRsjfSPT1mHDxaT48aFoorh9L4ShSMi1vk22QncLgQw+93Tykg2Rcsf9e99g0nO8/o3GL1YLKQ4I0H1+ghthbZMwgybhJb3y90wN9x6GrGbKjA1USgKQE7SRODN96nAlITXvzCGJd2/avMAVXBV18aFXDMNwYXvVaWEMkpTiJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=efMSRc8B; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-223fd89d036so5784655ad.1;
        Wed, 30 Apr 2025 20:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746068595; x=1746673395; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=beMA5sElXKoo2pkT7edbjdGukxF5tPMzP2VFN0Yo0H8=;
        b=efMSRc8Bgg9rat8XHwmBrOEq4HqYPvoV7TuPu4CFy58+BTcfLW6SgYQ2xq46KbBLiX
         p3eOUYEz/Jrw9hMFedsHHGLauMYUcpjnV5LXn5QV7Ve7exU1vAezJIUDDL8VGGregCHC
         gXAAMoiOTaLE8uT+Jxe3dp15GorZ3MtNm3tUBQc1NnPKbcX5Pjhd55WlTzkwiVhHNJ66
         ozQnP5oZrdOgYrtxupKfpayOE5umcjijFeb3GZa5OKdDYPFRoFoJ9ssYSH8qskl4iBmo
         A7qR4zdyURnZQbQTzBXqoOHjyaVmsLLnH44ADlfXkhRwlK/32l/7Q597Mp35K6AQ2jdo
         2H4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746068595; x=1746673395;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=beMA5sElXKoo2pkT7edbjdGukxF5tPMzP2VFN0Yo0H8=;
        b=MVUK0f+Tnx7A3iu246sUwtMqi1q/1mw64nziLDt4/6VbCpbm0dh/uNiwNrTphkWEXX
         LK2123Gph3Qsi0cRvuVCCCc3foqULk/2ypGpCWI+irpQqmNfYNnoTz0OfzAlK1n2FU+d
         MTelLmRPCRu6VWlnL4Yz+PEypDUebFoXnuWE7L2L4RjmmXy5BpNRxJRpOYOsThCNilMS
         znncsHCVmKBTfkk3T6aEkyG249cUJ8EitdfY8+nc45+NG/mLklMqzeotVXajWHcAceFV
         fdmJkW71WxFbNzZ9Th2QLtjMWjZptp2WiKpVYcfhCLyJv126sU3lYfAWJ5q1LxWq3BQ7
         WRhA==
X-Forwarded-Encrypted: i=1; AJvYcCWo0s5q8DVz3c9zhfrj4lzxGcU3hivHtm72IiV+sDo1WsnXb54ZLFpZ3FwdAzVSQfNjdfjxBnGaJs1TyXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3zBEa8BeSciUyER3Qa1r1rpCJYxwEcY4FElNYfuKPh7h7rp0B
	fhQIgpuM6X+SQU/Up0GvYG/Tr4jRk4qXyMbJMBg15FuVcSmYeT4xoswGog==
X-Gm-Gg: ASbGncuJozoLQjMQ2zkDAZzAxt3wv+a+NhjlVs5dq4jX6hHLKm3juNzcWWiBMf9+sO1
	fTCgMB7Qgtdgb6XPxWcABysbDwl6REcssMferP1dRZzqvjOBvUzRJRh/MvewM0SBQu0IRXRzKVh
	ZbTdehMSWE5zpkHt8czPvezJxSJy2vKlkfcD6F01QYrE0yEzTIgB5Yjj9Tr3fBtP7gBASe4brnv
	Y1TzLSDyiIsgtClExWaQsRUC0+Z1wQcnKjPboOt+6KZAmeXaDqJ5iAoCDgmkxXBPspkJNdx/PhS
	fNJ0JtjmZLUCvJdQVMyTb297cYxxU/phChbDA7vz9g==
X-Google-Smtp-Source: AGHT+IFXkW7bIf6IABYwl7F78ZSgJyCVMp5xzE52bcCoWhDyk+rvClVi0J7gR4bWsjdJ+r/7aRwVYg==
X-Received: by 2002:a17:903:3bc7:b0:22d:b240:34c9 with SMTP id d9443c01a7336-22df585ef05mr85411125ad.53.1746068594547;
        Wed, 30 Apr 2025 20:03:14 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:bda7:836a:d9fa:ac5d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db52162ffsm129980095ad.216.2025.04.30.20.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 20:03:13 -0700 (PDT)
Date: Wed, 30 Apr 2025 20:03:11 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hanno =?utf-8?B?QsO2Y2s=?= <hanno@hboeck.de>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	david@ixit.cz
Subject: Re: linux/rmi4 driver: "BUG: kernel NULL pointer dereference" when
 accessing update_fw_status or bootloader_id
Message-ID: <u7x6ckgtetuvgxaalqcxwsv25xvvcjdcehpsysbvxjqygzjokz@bwogeb2ne2cw>
References: <20250430213816.7527e190@hboeck.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250430213816.7527e190@hboeck.de>

Hi Hanno,

On Wed, Apr 30, 2025 at 09:38:16PM +0200, Hanno Böck wrote:
> Hi,
> 
> I noticed that trying to read some sysfs entries created by the rmi4
> driver cause a kernel oops (BUG: kernel NULL pointer dereference).
> 
> This can be triggered simply by running cat on these files, also as a
> user. Tested on a current vanilla kernel (6.14.4).
> It happens when trying to read from one of these files (exact path
> likely will differ depending on system):
> /sys/devices/pci0000:00/0000:00:1f.4/i2c-6/6-002c/rmi4-00/update_fw_status
> /sys/devices/pci0000:00/0000:00:1f.4/i2c-6/6-002c/rmi4-00/bootloader_id
> 
> This is on a Lenovo X1 Carbon 2018 edition, lsusb lists the touchpad as:
> Bus 001 Device 010: ID 06cb:009a Synaptics, Inc. Metallica MIS Touch
> Fingerprint Reader
> 
> The dmesg output for an access to bootloader_id:
> [   68.184846] BUG: kernel NULL pointer dereference, address: 0000000000000008
> [   68.184866] #PF: supervisor read access in kernel mode
> [   68.184875] #PF: error_code(0x0000) - not-present page
> [   68.184882] PGD 0 P4D 0 
> [   68.184892] Oops: Oops: 0000 [#1] SMP
> [   68.184902] CPU: 6 UID: 1000 PID: 4704 Comm: cat Tainted: G     U             6.14.4 #2
> [   68.184915] Tainted: [U]=USER
> [   68.184919] Hardware name: LENOVO 20KHCTO1WW/20KHCTO1WW, BIOS N23ET90W (1.65 ) 11/07/2024
> [   68.184926] RIP: 0010:rmi_driver_bootloader_id_show+0x1d/0x60

Do you have anything earlier in your dmesg referencing "F34" by chance?

Thanks.

-- 
Dmitry


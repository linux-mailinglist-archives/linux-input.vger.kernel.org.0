Return-Path: <linux-input+bounces-5349-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 783D7948057
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 19:32:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAF491F239C4
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 17:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D94A15F3EC;
	Mon,  5 Aug 2024 17:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ss6Ey2Mn"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB8F15EFCA;
	Mon,  5 Aug 2024 17:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722879113; cv=none; b=iEhfRTy1Ra3SYKkVMTGYOUGTct4kLLnQIidqcKMXHXmY4lKq0BSOnHlESKYa7TvjZNSv5AQNXSqTQOOODkjtR2ul60F8+WNZlZ/DOOWktnpFi5egYKuF7GUF3ts/wMRp2BWHrvKk04UJAM56sZ7uJiN2//boNiNWLIywSRi72yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722879113; c=relaxed/simple;
	bh=0TKwM4IxVNXlJht8oKn/hS7Cmk3dpFipq+atDXv0PME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qyhq67duucJdQfLbjmMArPwxIit7iCTDbdaCYygFOIHRk5DNHN236NaC4fowXZDN+D7VqJXttluk8Hkexwp4qn7PpWWL9LcC7GsZDSKl6IdVjW08iJjo15tWZdWsKpDtaQJNBOyydJ4gP2ZQ2PH1e5RIVx8SKoY1t3GXQGc4x3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ss6Ey2Mn; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1fc587361b6so78472555ad.2;
        Mon, 05 Aug 2024 10:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722879111; x=1723483911; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S41soigpe1havPY/3AlE2u1puA3oA52kWjpLwGraE/c=;
        b=Ss6Ey2MnF99FB5LFK7kEi3bxGy6lYZRD/WZmXojqeXWhyFGKAk1J+viwl5fhNMJLH2
         ot+oG+CBS9zXpa/ejBVVjPq1NVqI4tAItVdQM0Rnfucriiehz4y9nUPmpqQZ5Si/Cgaz
         7avtHwSkRjKo3i60wzaysdON0Pcb5odur3uFckc25bFOUmOIefqct90B7VKJUktscDvT
         Fh2joAQfXWHkdVGwgWlp1SiaoxSMsPvc0viIinVnWUtnxnV/lnILdnaYykFTHV7Ya62X
         VS3tA3H1IxeJCJ3SMH4Pveg4REfm+FRhGeEx/lqarqzk+eruRqwY/KoeCjnvryJRXf/y
         Fd9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722879111; x=1723483911;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S41soigpe1havPY/3AlE2u1puA3oA52kWjpLwGraE/c=;
        b=dDUfdGRVsBhmWuggf8DlFObW227Tk/UBiyNfYQqLudjne+hi7luDYI6jZu1nLknW0S
         2HWs3iAeUUV0XOzvOoXcjb27oeyPbeKl6x47f1T4gSnR1X1wGEU/wrU1V5FQ8IQGVjkm
         nhwOfvby5ub4bFZOhvVmakYKcV8pSQRLmnEMg+IzcB7lZaTTYCQeA7q/of5isLhjDgkB
         GHDHA5jaKsvt1GqBPj8EbkoatB4enFKbXu2SHM+NkosdUr+Qoskx0CcEWMxmGfZLjTmv
         ex/SfR2C96hqAeP7c+5g43BeIp/SdqJ7CUIVykyF81GPpTMJDxyE7H/V+4wt9UJHzqxV
         AvLA==
X-Forwarded-Encrypted: i=1; AJvYcCXeaO3N3+kCIEE6lgkaJVkNSB2PPSuP9jCndNIpsG30rOISgZPmSjHq8HUU0Vv8eQSZBREf+ztKcNA39PH86BlTrhjtkPWtTvA6bH/Q
X-Gm-Message-State: AOJu0YwrYU/DWaHECxdDk6rfNn6cp/W4s4dPtWrwHIBBO7tXgAklFzeT
	XKZ9DnO2hv1SpqZklAXwnv1VsEgvxXjJJXYud9Fj4nJXlAKfMVmM
X-Google-Smtp-Source: AGHT+IEiOqkbaOFZALKm2RYjZ7PsfQk+NTSQYmxkf7bC3IMOHpfBiMRjX7SCLOByXhqHLdkLeNR3TA==
X-Received: by 2002:a17:903:2441:b0:1fb:1cc3:6482 with SMTP id d9443c01a7336-1ff574627c2mr113886925ad.45.1722879111275;
        Mon, 05 Aug 2024 10:31:51 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:b116:76da:13a7:247b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff59176d93sm70742215ad.204.2024.08.05.10.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 10:31:50 -0700 (PDT)
Date: Mon, 5 Aug 2024 10:31:48 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Marge Yang <marge.yang@tw.synaptics.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	vincent.huang@tw.synaptics.com, david.chiu@tw.synaptics.com,
	derek.cheng@tw.synaptics.com, sam.tsai@synaptics.com
Subject: Re: [PATCH V2] Input: synaptics-rmi4 - Supports to query DPM value.
Message-ID: <ZrEMhJ0neCDx5hij@google.com>
References: <20240805083636.1381205-1-marge.yang@tw.synaptics.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240805083636.1381205-1-marge.yang@tw.synaptics.com>

On Mon, Aug 05, 2024 at 08:36:36AM +0000, Marge Yang wrote:
> Newer firmware allows to query touchpad resolution
> information by reading from resolution register.
> Presence of resolution register is signalled via bit
> 29 of the "register presence" register.
> On devices that lack this resolution register
> we fall back to using pitch and number of receivers
> data to calculate size of the sensor.
> 
> RMI4 F12 will support to query DPM value on Touchpad.
> When TP firmware doesn't support to report logical and
> physical value within the Touchpad's HID report.
> We can directly query the DPM value through RMI.
> 
> Signed-off-by: Marge Yang <marge.yang@tw.synaptics.com>
> Signed-off-by: Vincent Huang <Vincent.Huang@tw.synaptics.com>

Applied, thank you.

-- 
Dmitry


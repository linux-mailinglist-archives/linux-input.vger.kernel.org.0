Return-Path: <linux-input+bounces-13373-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FDBAF8703
	for <lists+linux-input@lfdr.de>; Fri,  4 Jul 2025 06:56:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 364E57B4B7C
	for <lists+linux-input@lfdr.de>; Fri,  4 Jul 2025 04:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39E951EF375;
	Fri,  4 Jul 2025 04:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aakER9Cm"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC01E2F2E;
	Fri,  4 Jul 2025 04:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751604959; cv=none; b=DdbD1PnlYaBXPTTcKRS+6f/SmFCG8Md8SkiQSyc3k+E/utf/tc0xFzv6zbgTERT/6afAsGPo2ZI4CzkSBqSvsN+vz52oqxZ69DLFYOqYDQo9j+mwL+JB6uPGZLVDvOfDQWXPfgRbnlf/4eHDMLMdL6/u/2Ci7lbzXWuyg4WjKXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751604959; c=relaxed/simple;
	bh=iA7enkcaYYP10zGHvuzjL4NSKWxWCwqiCSwCw5FbyZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eUS/n5wTqP9dZqJ/lH/wbFGeIPtuaOR62lRzixZuh2p+Y55qgEPe1iV1m86egmUdvXvEn3BwByoDakxmtfpboXXUw4MZM8MqJxIzNRRqOlNjTrirJa61edhKwvrlOyTc/SeYda3om70D4uTpSPJhOd/CdwLoYkbLkpJHpoOlu0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aakER9Cm; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b3507b63c6fso591093a12.2;
        Thu, 03 Jul 2025 21:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751604957; x=1752209757; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CifI9suLoX8sU3mMb0TVZUF1eSg8fmqZC9+fcJINJg8=;
        b=aakER9CmYUER5m8FVoYf8g9AHBUihA653Ox9IlKa3eTvrLo86Ex7Fxy26Zh4iaznlx
         dp9V35xbR66YjhsofXr4D5bzBNyw6TaIragfzvdAmvkWIQmCd07I5c2oE0GxmmvMY+Hf
         OUu5MbpLQe7oWqTGPdSKJZB+oRN1nurlSA1vz7qjq6esPhJ5pxF30zKkVuWcx5LbK9yf
         lmfvosTDjjtwv0ORbGepCwVKmsVKxmiDEv3SwBm10HnJhVKxb0jcCvS3SkYltv9gimwS
         oKRV5X/SqajdJAyKfMf80N/VcjLc/ceAUCC38S6hT56ImVp/jaLQpf/dFzeCKziCtb/W
         i3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751604957; x=1752209757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CifI9suLoX8sU3mMb0TVZUF1eSg8fmqZC9+fcJINJg8=;
        b=ceJux50+SGiGogC0Z9Dir5ZdzhGj8p+m0cHikyf7TVocUb9P1IS0A+GGvlMEqZCT0k
         +OYb4sgc/eX/BDIV72oGchnKGDCqq2/fDjxQ8CngUXadvTp9g6fPbldmGqX4K7jMa1cr
         7h4hBtlMNEXBnYUurhDTHmISq7lTSCjRMV4mo5l7R2YzHzybiQTHd0lYTGGH5S0sOl/s
         kZvyz4SFN12TQqnclr/fDthdLulLE2b1tYyMs0yf0QHSvzl1rWMnOS0wEwcThJ59ZCFI
         W11q0Om5rhUsonILAG+5EDkiB4nMjixQB/n9Y+N4RUU8hVGUsmTxnLPf5PxxJBxndz67
         zHlA==
X-Forwarded-Encrypted: i=1; AJvYcCVi5XY7ePCKqKmuRORwIrDrtrgZr45nrnTEa/sEJSqSHw0kKqtUYK3o4nZ5bj3VcMnK8SRTMzlljs80pg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOMyKjjpycr7tednwOXu4k0GLKaTI0MoEUsllEVUvk9Ldi5a/Z
	Vj/85f7F1APHVVAKtHPq7ypPajFphg7cCWX/WdRN0Rc5PSIMOc07adQw
X-Gm-Gg: ASbGncuZv5gmfcnBAj2RVAhR+1NQ/MLOXvOLfgcSuMRiW56RUX23FHaeQ4J65GGHJgf
	aeyMsl7Iba4rF4uEw7ICTBKoItoDNbqWL8wbNmT+xVbAsf3N9qt9g8NfzGHF72XIOG/NSm72oKG
	wYE26aOaD5XIO79q8PyXs/26mcNkdScGFXFaRh2yHokmwr+9iDbLUVQiCiCG8JmXazya/QqR2ZS
	SmxZ8tw+SI2nH3ocOp4cTgfvnET7WIbnlmoBGkxQylGyHDN6iwn4/p2s6wkjxIraP0xdfE5vQBL
	BCHjTi1mM9XXKk5CZZ7UXBQrxyZ4v3JA8Kbc7P5za6iijVv+arzf7g1cQJ7OMaE=
X-Google-Smtp-Source: AGHT+IFiqePAzezgFsSFO8Arbd8+5l8xDnvBOdMdeFdQca+DfwPdk3ANsY9pByJSA22HhNseC8mpog==
X-Received: by 2002:a05:6a21:6da6:b0:21f:eec5:85d2 with SMTP id adf61e73a8af0-2260c2401c6mr852418637.19.1751604957019;
        Thu, 03 Jul 2025 21:55:57 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:8ddd:816c:9ca2:2a5f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee5f32c1sm1051265a12.48.2025.07.03.21.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 21:55:56 -0700 (PDT)
Date: Thu, 3 Jul 2025 21:55:53 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Yunshui Jiang <jiangyunshui@kylinos.cn>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: cs40l50: Fix potential NULL dereference and
 memory leak
Message-ID: <m2i5ewrkh72dl3lcrfqpoy7l3ohjkraogpqkskvvybg2oshvm6@dnximnav2uqf>
References: <20250704024010.2353841-1-jiangyunshui@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704024010.2353841-1-jiangyunshui@kylinos.cn>

Hi Yunshui,

On Fri, Jul 04, 2025 at 10:40:10AM +0800, Yunshui Jiang wrote:
> The cs40l50_upload_owt() function allocates memory via kmalloc()
> without checking for allocation failure, which could lead to a
> NULL pointer dereference when GFP_KERNEL allocation fails under
> memory pressure.

Yes, the check is indeed missing. It is likely that the allocation is
small enough so it always succeeds (or waits indefinitely), but it is a
good idea to add the check nevertheless.

> 
> Additionally, if any subsequent operation fails after successful
> allocation, the allocated memory is not freed, causing a memory
> leak.

This is not correct. Because the new_owt_effect_data variable is
annotated as __free(kfree) it will be automatically freed at the end of
the function scope. Your patch introduces a double-free.

I will adjust to only keep the check and apply, thank you.

Thanks.

-- 
Dmitry


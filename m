Return-Path: <linux-input+bounces-7074-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0979901EB
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 13:17:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8420328161C
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 11:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 585411487E3;
	Fri,  4 Oct 2024 11:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nm0xAEjV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D3B224D1;
	Fri,  4 Oct 2024 11:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728040623; cv=none; b=KW9LH+IHL+PEabKIJ7Hog/mEqEyEnozK0r4g3OcDumVxjPKWQ/yyfVHwIG394sXrEILMQzGxD/e37d0C1wnbSK+o0B/apvXA+UOH2qsU+ABTohEKYNmDp9p45IDxfqYI9ARm3pb+G7cWiQVa0/bxKDgOSa/LpD6Flx2BddpmfY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728040623; c=relaxed/simple;
	bh=YyLTiomqQ6TSxJyR30lzcROF9cPW32e3GhYgtOPTgew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jy3LW32pwrR0wsnaL87zfJecWQpXAmffA2zFwXspGNWDJXnc4j/YBRRClwMAxtfYTczIlEiyyMZIcv+CPid3l57lDRMS8ShuccX3rxZF/0VvT5oIhiwJEirCa0LGc/huUY1YVy0ZvZ4JJae0BJ8p1cSAOxOsLbhGipJ6SpY7aao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nm0xAEjV; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20b5affde14so15245205ad.3;
        Fri, 04 Oct 2024 04:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728040621; x=1728645421; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4JGGLXYFztMV/0fUe6OuC/kyD9hrYXAZAqVRzK4LsKs=;
        b=nm0xAEjVYQVp3oDuB75qhemaUa1BZpYC1hNRc2OlvVdDh/+W+3iUfP6t6Ke1Ake/x6
         URfCgkIGUWkAfxmPgUMROxpT4p2GvFicnH4Z9v1eBesqgLhB5SZ+R956A6iJ2PDLRaQF
         iQrLJVAkXThCoqtk+WWdywdZVnuQiLyXeIInYl/L5KqpKDf4t4ZPKrWfoOimBq3SPazj
         CIWpRz31wxr/ujr5NK1dMAVx3zg1eJTJ33YvnOZEG2cAJdgif/YdnPurwjACsOgYqKyo
         ZmhoxjWB4KiLCiR5is2f35c/qFGHviGWB6CrYr6RVtuLEDZftQq6O5OpFC2C11fHvef4
         hjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728040621; x=1728645421;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4JGGLXYFztMV/0fUe6OuC/kyD9hrYXAZAqVRzK4LsKs=;
        b=bcIyfdPdgiJUr89ShH7wPAn2o0jQ8HHuZwDRD8ffdKy6Spj8/FYqYWQemvMDQ9C2tM
         Z2cQPcTWxaZ++EmlpqCZ2W5SYLyPS7d30D1RTsx5sgBilZFfWyWzMhcn56G+OsYR7Ebh
         JmuQfS1KsuVWCcP1mAfv9w9J59yuqg+RWN/TVvzhuy2LPQDUjnldsKFpsxDbG11Iufx7
         /X3/AjVioLsArfPLXQcR2HiwpeWYjeS6xtpaEJnISundIgIwWxC7eFH71L/md+5kVxMI
         z9DK+FF/etBi1V2TXN2Ni9bg+4MkZhsC9MWgbKIRQRRwBcfBQF/gYzpda+ZK+a9t4zxx
         AlVg==
X-Forwarded-Encrypted: i=1; AJvYcCWUpDXBzA1WzpETno2n7Rra9rLLKCPkwknNLaec8WsrfdX+8vR+p/KtOxeMOuu7xFM6a1+QtXe1mKXVrCk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwN11fJ9lxKsjgfOIGKF2O+WbJ9vrmh2lt0W1g8NBGUHYMFvvT9
	USO/kFGA1FEy6ohMIpwTAulZzju0ulEC/e6qluR2rcyeU+f32NHW6vea+9UD
X-Google-Smtp-Source: AGHT+IGEezjSxQ5pCOb98oeSdfx36nnKAzBr04tyF8g/ReJ/sQ93DVf278brTyX2J1IAS8P5jisBtw==
X-Received: by 2002:a17:902:f550:b0:20b:a728:d130 with SMTP id d9443c01a7336-20bfdfd93ebmr38169455ad.14.1728040621141;
        Fri, 04 Oct 2024 04:17:01 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1b2:add:2542:c298])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20bef707040sm22164085ad.269.2024.10.04.04.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 04:17:00 -0700 (PDT)
Date: Fri, 4 Oct 2024 04:16:58 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Yang Li <yang.lee@linux.alibaba.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH -next] Input: matrix_keypad: Remove duplicated include in
 matrix_keypad.c
Message-ID: <Zv_OqtnB5plGVAUv@google.com>
References: <20240910010133.44579-1-yang.lee@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910010133.44579-1-yang.lee@linux.alibaba.com>

On Tue, Sep 10, 2024 at 09:01:33AM +0800, Yang Li wrote:
> The header files consumer.h is included twice in matrix_keypad.c,
> so one inclusion of each can be removed.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=10823
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Applied, thank you.

-- 
Dmitry


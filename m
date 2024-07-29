Return-Path: <linux-input+bounces-5181-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDB093EA31
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2024 02:00:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E68E9B20E41
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2024 00:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A84011E487;
	Mon, 29 Jul 2024 00:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJlFSmaG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47324522E;
	Mon, 29 Jul 2024 00:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722211228; cv=none; b=sQDdf5SvUqVMbfSaPX+3d/UR03a1UDyge3ghiKmT442l1NpNMh8mhaqMmOp9Al8NoaBftLfsL4/vYP9MqP4lMYNkr6qkIFXxM5Jx5WQGLpuq8n6V0EMrMA2OVXMO6xQiCtMTI2XuqyPr+aLG2zM4LfDFb7xacFGYZPhazCZGvSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722211228; c=relaxed/simple;
	bh=jJ6HkjJ7h2i5lkNtHPdsfS2FxU8gIMul5gx5RcbmOG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hMKYvTkQb9QrsEd/wOZPI2GFAQHJtdC6t/O10Oz/NpyiY51MQMHCTKU4lOvf+U94toleXdqjhoVfFCZHzobs+7F0SdnIfvrQS9ukn1Ycih+OmNqjry0ZRkgR7dMN36YmPs/9h2LryFwnu6AwvV5pssIiZruqTnFf8jw8oUC1tWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZJlFSmaG; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2cd48ad7f0dso2147917a91.0;
        Sun, 28 Jul 2024 17:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722211226; x=1722816026; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XPwiohtJWANAnFeqeGFhy00VPjkQNBT2pIiXQeTq6wc=;
        b=ZJlFSmaGCuWJv3D1SN2TxhjhYe2pCU5QP2tfEtbBgp/9sgyERlAB61jQdEyayfNIwv
         ydgo+I5V3+kyt9WctUrxtZ+eiS3od5HFFF4mMB3EWaF42ExziD9CvAW+luffL7ASwbpp
         gczGSq6mRsZ8LY0AENXwtxOcixdrYwYG8049N5H3qfMWJ7P4HSkAISOIWixt+lzFpwvu
         5NYISKS8SfTXpPRxB9gysL8BJCLrNnuEd5hJuV+X0WgK6prpyLNtYAl5N80Q1MdyCgBB
         v7iTsxO5xWaiIBblRrRIvUZMK3OsYkT5wgky9fGVFlbeXURN2ql3zQZgMefx5zaOf4Vl
         S3Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722211226; x=1722816026;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XPwiohtJWANAnFeqeGFhy00VPjkQNBT2pIiXQeTq6wc=;
        b=J9/VNvgS66rhxxWt3LLmTc6xKxwzfyxRXeXAO8JMzV/VvDo4KaNIFZlpaltFyXDHN+
         MPkuJRKuKgq52v2YI40CNLBm9Fb7uuADSTXu7AZNWLudBQZYiOORzz9x0y835js5l1tV
         xTgEJO0yDThMJ61jkvCZGqSor3zR9qBNpWVhK4q/Kgj0lVawHMajvxcUYhbDiSz5JI9F
         jy7QK0Puo9CiqsgU79JgUFyaTZFXdblAMLGsoYG9qlXpltFCQZI9ivHQqb1P8HhEA8x0
         2E4Mi+FQhUCtpaDh948FzLyeYpI/9QzTZgv9XSpLNayxbq2OI5O7yWGHC3SqVpKRhmls
         slqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbnouXkGIYl9vRQ0GY4eEUUwcYothN3CjJzxkddP1mn2Q3d//qzVFFzXWPVv+99rSmknAmiTYHuwCJ8jUuRhyTA8xS8UoVNG3LLB6s9LI6hSMYNbN7qJRHjQgf6NRaOUR/lfylPp7LrFbsMBM=
X-Gm-Message-State: AOJu0YyjKl9qx60PBEtJrOl/bVWtVW5bC+siA2epHiFDRDNG7bDrhn3+
	uJVFCsqHaGSub1YrcdfzdTDJ3OVpK+MMJPV7yK6BALxQVZpXvm6TEHrMKQ==
X-Google-Smtp-Source: AGHT+IHw3r8n6Jtc/MdwhlvCA89enqBR70UYDF4j84TO6veBH+/NYaXrMKjh4/pbytVeLU1Ctl315w==
X-Received: by 2002:a17:90a:a790:b0:2c9:1012:b323 with SMTP id 98e67ed59e1d1-2cf7e5f51d7mr7234899a91.27.1722211226321;
        Sun, 28 Jul 2024 17:00:26 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:74de:62d6:bed2:4c63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cd8f73bd52sm4543803a91.1.2024.07.28.17.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jul 2024 17:00:25 -0700 (PDT)
Date: Sun, 28 Jul 2024 17:00:22 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [PATCH v2] Input: spear-keyboard - Switch to
 devm_clk_get_prepared()
Message-ID: <Zqbblj4rPjmAhvt7@google.com>
References: <062986b0a5105cbc61330da0e55b22c00e2c1c4f.1722062145.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <062986b0a5105cbc61330da0e55b22c00e2c1c4f.1722062145.git.christophe.jaillet@wanadoo.fr>

On Sat, Jul 27, 2024 at 08:36:49AM +0200, Christophe JAILLET wrote:
> Use devm_clk_get_prepared() in order to remove a clk_unprepare() in an
> error handling path of the probe and from the .remove() function.
> 
> This done, the whole .remove() function can also be axed because
> 'input_dev' is a managed resource allocated with
> devm_input_allocate_device() and we can fully rely on devm for cleaning up.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thank you.

-- 
Dmitry


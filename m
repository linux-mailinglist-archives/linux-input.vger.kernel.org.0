Return-Path: <linux-input+bounces-5699-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC42957A7D
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2024 02:28:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 725671F23072
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2024 00:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B15F522A;
	Tue, 20 Aug 2024 00:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5pcYm8/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46AC4C66;
	Tue, 20 Aug 2024 00:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724113702; cv=none; b=qmM54T+JlhplnfD/7vGiuxFHgl+zTx4F6aXCbryCwgxcpPf6DXcW6Xv9bTeucwPmoqecu6upEjrgwlyuoFtdhuxhGn8xGK4L833IF1rD2sOnGNVb2GWpAi8yubvquzHUUm0HOU6vK3KrM65CirGYILWR3rWfzXljmefXG6c41Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724113702; c=relaxed/simple;
	bh=g3gpBwL+B5ZJ8NjCtxm282xSGoZ58QBB9Wx/FNRCdnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TLc1WMwCkYQ0iJ+VkkGiROCAYYgOjS8tmRqY8d1YvWHdFSet1Ysan68IK+yNOG6MOzqycNlO0EKZJ5dE8osTEBzjmXfP/LQ5juIVmkKpvuALJFwsflYuF+8aN1L0T+Y8bS+FlteWO7/EBhAkdPtOVC+EnEm2xhvJnF/YsEc3xes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5pcYm8/; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2020ac89cabso26507385ad.1;
        Mon, 19 Aug 2024 17:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724113700; x=1724718500; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5P8WpQoTvhu+O7jRED+d3IXgvB1Af3gFVvat8qHTkBI=;
        b=S5pcYm8/F7Ao/W106yyIEevEt0DrOxKg+HCdr868yEbuYclYW8aip64MDSYG/PdqwK
         hiOSiEADH8i9LpegzbX3V0e0/Y0aGRaZPgjCtVeocBHFy0AyvcY1JnxiDS/8hSk0isrP
         GgfJLjZVd4PAQ3rX5eLTJ1mrGBQyAPpoEmA4UbWFZjlRk/jXuw9UMn4qQFTCD30ytKLG
         PI33iFRowzCy13p3E90k/+w+3HrmPC7vvDTdI1lMeVXzbt9NBr19EhTrsyHCVkvJBNdn
         fhLPBY6iLNuvXIjXeNUK3VJDjoz3P7nU8SDlUdqhc4iXZ5xFBgbHzx4Xt+kp+6pmVyqZ
         J1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724113700; x=1724718500;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5P8WpQoTvhu+O7jRED+d3IXgvB1Af3gFVvat8qHTkBI=;
        b=VioKEfFYgo4hgvXdu8e3i7YzMHBcorjrudWI/QvcWe9ZvmfCtLEwtB3ICpH7gU6Peg
         TLq0r5bCIR7vL5OC7WAixrLY0qlmHV3tmQZEWT6Z2MmqAMHGUPJlEVtxHTzE6FVO/d0C
         Sn2nh2bHdnwpLk0aplbERrEyRAeyxiXev7x3CB2D1PNq/Dm3IKix10xmp/54LrEx9XPI
         I1gjy1tfB/sWE2Kn0dxLnYrGoxQhlw+Sau3s9IL+2zlcIoa7A0rpcyogNycpsF1VABHv
         y00uqCB0RdN4uOzSb0H9kzxtEfU8QE0lAytMpQ4Ly/6LXHGFbEmx+U+h/Fb5cE2meA58
         OCvA==
X-Forwarded-Encrypted: i=1; AJvYcCW0+IDFoyJUB2v5JXllP4ME/nzrOvEMwbkMphTLddSN6F+4EOg78ZXeTTXW/7c7FjARvMN9JrPVABF/jKhJ@vger.kernel.org, AJvYcCXlY+KbU+g7w3jkrhmk1+Hai+k1EnFQqL5l2JmkvchYoLkxpIiLJbPREP4/Gt7mLs5le+4ZTX83sa3WRA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9M2mnk/GfyBf7OYzcJw4wubAg338M/E+OsIHY/HWLIXHs8H8t
	TU+t/NdYJ+bqCSmCn8/mDoFWRVHI7snZa5rR3FR5mRQ6I5wXWJg/
X-Google-Smtp-Source: AGHT+IE8snDFn7fLYkbjB+uaEeiW337OcPjVQGnq007KzIppx9LClrtq8ORqfk1EXqJTykJhODHPhg==
X-Received: by 2002:a17:902:e5c8:b0:202:35e0:deaf with SMTP id d9443c01a7336-20235e0e226mr64498415ad.39.1724113699481;
        Mon, 19 Aug 2024 17:28:19 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:f80c:1483:bced:7f88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f0320edasm67669745ad.115.2024.08.19.17.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 17:28:19 -0700 (PDT)
Date: Mon, 19 Aug 2024 17:28:16 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Felix Kaechele <felix@kaechele.ca>
Cc: Job Noorman <job@noorman.info>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: - fix incorrect size when reading product ID
Message-ID: <ZsPjIPiKH7UXmF6Q@google.com>
References: <ZsPdmtfC54R7JVxR@google.com>
 <f6308658-0ce6-4b40-aa6f-dd75668ff142@kaechele.ca>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6308658-0ce6-4b40-aa6f-dd75668ff142@kaechele.ca>

On Mon, Aug 19, 2024 at 08:24:33PM -0400, Felix Kaechele wrote:
> Thanks for fixing my rookie mistakes ;-)
> 
> Just tested it on my Lenovo ThinkSmart View and it works fine.
> 
> Tested-by: Felix Kaechele <felix@kaechele.ca>

Thanks for the quick test.

-- 
Dmitry


Return-Path: <linux-input+bounces-6596-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DBA97BB18
	for <lists+linux-input@lfdr.de>; Wed, 18 Sep 2024 12:48:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83C881F21B0C
	for <lists+linux-input@lfdr.de>; Wed, 18 Sep 2024 10:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B33A517C9E9;
	Wed, 18 Sep 2024 10:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SIdxBIhL"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E87017B401;
	Wed, 18 Sep 2024 10:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726656504; cv=none; b=BJRU/O5J8nHsh5pzPq1k/lFP03pJ78aMxIgnaiGgUMdN2zWZhGX2dNHo+llVmRUQ1t9teemLacgN9z0V7kG7F+bYE2FDtcI8Y1t74ZCLTWqbebIBaQC78aOCWs8U+43/Y2AlAPntu8M+czjtJCq/PZM5RZqqtafivjpX7MBdOO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726656504; c=relaxed/simple;
	bh=PC0iyZgo1Rmb8B4v4wX//KN99HkB9Bi1PjwxOZYGiPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dBWcVWZSx5+4T4gyIrI7MrSk8WEVNsZwbP2Eza3FoSmcYY1DgcCEXeirYVaA6Oo7deIlsTir2vQRKmni9b7Of3GCQZ4V/OlyMTI0swFTGRxw07ns3h6dUwBQPjwg7FN/FXOXhfF1iR6oULDLsmh2+/LydtNVNteQOZw7cXumiVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SIdxBIhL; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7c1324be8easo550184a12.1;
        Wed, 18 Sep 2024 03:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726656503; x=1727261303; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hfzW1pLry60+t0fvh5kw9hU4Fd6lBIA4q/rFKi9crYA=;
        b=SIdxBIhLlJzwHKiz5aST6HxasiDG0hADLp5eDMPNV9eRj7SktPfMWBk5vkBK5Zs8x1
         6575CFW1B1rrGB76HpdGTRFq6DA8f2LyTKVuK8qYZ85/aytBq6E4wbctLNrD6ERNQbQQ
         0u1PwV/aViiUvA6eiPDvOwXwIPe3GB2lzqFnAyn0dbyutzXcpl2LrExyI033NkRH3mGt
         3ymhH/yKFGtQS0NC1+cA06of6aNlzns2k3JRWw0sEaSHDZVJwqvlce+iy+AvcoZnibJL
         kBwvRvkVs6y6ezEgOtAxIwsaBy8gSu4vzl1h75obzxEqmk66MsY9mfmbthFxk13IgIDi
         LVaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726656503; x=1727261303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hfzW1pLry60+t0fvh5kw9hU4Fd6lBIA4q/rFKi9crYA=;
        b=pwLhrTKpRJoZY7gZNz1hy/gbCXSflBXU4vkLSo7y5bvhKczoTPEKhYD6UG0+K961I+
         AeuUgZkHl9FnDesbjupKwhO1w3w3lpztg7wELiejkhURQCjFm2/hz0c81ZcuvBSDtt52
         Pw9XntfoGEG9z9j0s1E4EGYk7oHPzhylQbS2RUWHb7l4RfeOgZGD1oqKLN7Q2skfMUX9
         vHscNXRQOcUdMmhoCM0eVWVKSosZeimZNDExzs70elAUQdnLvQWRlF5zX3cPrkzZUs60
         kENvhyO6oyHxm9OzFAxkdQAa3QW1CRKYGpTID/JVlAtA4luFRlHd6OiG86o28HL1OmN3
         NzgA==
X-Forwarded-Encrypted: i=1; AJvYcCVEMEfjTgCoTlVLG4OyGpWU4C0y+mTIazZZJxNp6J1fBvnB8/fP2JCz9sqVJf6wenpkjkrwFCwvvAAEWsEn@vger.kernel.org, AJvYcCXq9Xn8uxf49QpMq7+l8GvfkRtMC8T6CIf/ctZiCRuaOVubufSOeBHXHE7cNRJeyjBn1W+Tk1cD5/IJug==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy87bb3zk2fetKiDbUe+caYTHiuAcjQJk7kqHrNvlcizJhG+ATk
	4KiRJnjNX5luCnRmERp6aA5lRqRUnPw8nS/CoGoMzFgUZ+1zeuIn
X-Google-Smtp-Source: AGHT+IHH+tk+BBx6l9XDwZ53jPRLIrOnAL/X/Zk+WVqedZxojkeyMgYzvLrNujRVxiEmJ0ugkq364w==
X-Received: by 2002:a17:90a:2f06:b0:2c9:90fa:b9f8 with SMTP id 98e67ed59e1d1-2db9fc66af5mr32452417a91.10.1726656502451;
        Wed, 18 Sep 2024 03:48:22 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:e2c3:aae9:be1f:5425])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dd609d6eccsm1261531a91.56.2024.09.18.03.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 03:48:22 -0700 (PDT)
Date: Wed, 18 Sep 2024 03:48:19 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Shen Lichuan <shenlichuan@vivo.com>
Cc: rydberg@bitmath.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
Subject: Re: [PATCH v1] input: Convert comma to semicolon
Message-ID: <Zuqv81YKzULugn2Y@google.com>
References: <20240918032246.9147-1-shenlichuan@vivo.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240918032246.9147-1-shenlichuan@vivo.com>

On Wed, Sep 18, 2024 at 11:22:46AM +0800, Shen Lichuan wrote:
> To ensure code clarity and prevent potential errors, it's advisable
> to employ the ';' as a statement separator, except when ',' are
> intentionally used for specific purposes.
> 
> Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>

Applied, thank you.

-- 
Dmitry


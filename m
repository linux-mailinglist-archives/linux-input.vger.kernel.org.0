Return-Path: <linux-input+bounces-4902-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B5F92A7BF
	for <lists+linux-input@lfdr.de>; Mon,  8 Jul 2024 19:00:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AD7C280E40
	for <lists+linux-input@lfdr.de>; Mon,  8 Jul 2024 17:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A95ED78C73;
	Mon,  8 Jul 2024 17:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQNIk2kw"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E915812;
	Mon,  8 Jul 2024 17:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720458040; cv=none; b=iVEj3XL5TA7bg7rI5vm34b3bhxTN3iz9Ce76xbzqXnWC9EtkGdZiY4D4iUq3/YBzwzVQoZ/OpIHHAm6wVfXI22y4T0oa8v01TdJBt64k1vLHPS4fv3ZpYHehAuPfAUlc+kY3z2fVPYYNSMsTh2gWTw1emDpoxTR+YA8xlEMeULM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720458040; c=relaxed/simple;
	bh=NmuMdJfhR2oiTFEWbpj1uQyxDljN8pBZjdYATKPFOiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C0It/xlP4cjLFUyZcPhCtt7IH6zmZ3f89aT9SQJwBkIjlrPcT+FnbGgDLxlDGiYpqbOfJ22Xr8YI/Hji0f5A1LyVHKP8VrlYrlqouopSiqSaBUoVTuqhG9LqS8A0czaXWVK6WEwhjt51Hz+Oe6QhFJbOalhSnK0ByuyhK9Yofys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OQNIk2kw; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1f9fb3ca81bso22915225ad.3;
        Mon, 08 Jul 2024 10:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720458038; x=1721062838; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8nANdOwpHit1RYjK8Y9G4LcvEfZKYIQZCkuUWYyLUDE=;
        b=OQNIk2kwZy9Bi8WeuBFDPaiHQHdtncecIZ5o8xIiEHirRr2m9pdd0pefALTMbyxv30
         MfRPcRl/oDRrgUoSrK/bnR1e0mqMIqP05zO1pyhB5V4jHAfSv/XiMVNom2Q/CCqMkfHC
         KWVocKGDUFFb6BcCQHwB7bgwKtAKXWEEM4TjAf6WlAvL7/FEmzhQ5xrJbYXEVD9rWLz3
         6QRuUGdU3tn5Zz41XztJb1j68EpyBb9C4Cc+X6ipxEuSGaeAjSmC72Y6gT+rHMsImjhz
         UhGNbgk2NPN58B/oh7XhjCOp+KGpzKUwyW7+uYhgMfOEJ5W3D4HO0cLauDr39xsaNCRu
         HJvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720458038; x=1721062838;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8nANdOwpHit1RYjK8Y9G4LcvEfZKYIQZCkuUWYyLUDE=;
        b=iJf5FIDRBO89R3YxXn8LNY2AUGI8ihM7Ka2Z39wO0BvSapfMs7QarPALhKnsEP1Rws
         39iCVM7aI2l7oLRSyJ4DinZHgPB5EgMCnwzk8CnwBVRwip8r6jefK2PJYb+muNgNqmWT
         DlW11T4W3Mq4BbhqN3hNVHulYnMdJ7oFSCisGmQs+gyPrnOFTmMqqLkNCCRbn9xkFSkJ
         gVXG1yDL2emDpEP4wxktvvOnjBrrHXX5A3JNjpUlAGwt0ZB5GfhNPFy5MO2MTnQ6Wsbi
         wRCJWYD+SSgNWmOamJK/xNsq6oB4WPInvB8t2SZ1I1Qg8zquPEUIA3ip3beOmnxQAvK2
         ECSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWQtpy5sfu8q7TUyEpK5+P7bcMl9NOBRYWv5hwTe5x9lIg18/C2AFglDgjA+dp/co+woTHQFoOxV9O9lWrIeaNv0Lu/SR+BXpD0bYE
X-Gm-Message-State: AOJu0YwNHu+6lrk83Fv46zRcMMcMUPYH6yarC5jw4Fseu22bitxoVpwe
	wfIQfwJovsDU99DToJ7gNQ4L+f1+iyl2YIjP02polRe84VWJRz1bvRXsuA==
X-Google-Smtp-Source: AGHT+IHVeQm1xBFxIEPwu2y6BsUwuu5tmfmbW7yRqE6oKtTl4FQcjEwe5Q84jOsQINLbxV2YJFuq8w==
X-Received: by 2002:a05:6a20:3ca9:b0:1c0:e08b:727e with SMTP id adf61e73a8af0-1c0e08b8557mr6891566637.62.1720458036899;
        Mon, 08 Jul 2024 10:00:36 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:d2a4:59f0:2144:2c00])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6ad3837sm841265ad.300.2024.07.08.10.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 10:00:36 -0700 (PDT)
Date: Mon, 8 Jul 2024 10:00:34 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mirsad Todorovac <mtodorovac69@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	Felipe Balbi <me@felipebalbi.com>,
	Peter De Schrijver <peter.de-schrijver@nokia.com>
Subject: Re: [PROBLEM linux-next] drivers/input/misc/twl4030-pwrbutton.c:33:
 warning: expecting prototype for twl4030().
Message-ID: <ZowbMn8BNJm_oufN@google.com>
References: <51a4022c-e5a7-48c2-8c87-0e26a1b7b406@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51a4022c-e5a7-48c2-8c87-0e26a1b7b406@gmail.com>

Hi Mirsad,

On Sun, Jul 07, 2024 at 01:54:12AM +0200, Mirsad Todorovac wrote:
> Hi,
> 
> This is the result of testing randconfig with KCONFIG_SEED=0xEE7AB52F in next-20240703 vanilla tree on
> Ubuntu 22.04 LTS. GCC used is gcc (Ubuntu 12.3.0-1ubuntu1~22.04) 12.3.0.

Have you saved the .config for the failed run by any chance?

Thanks.

-- 
Dmitry


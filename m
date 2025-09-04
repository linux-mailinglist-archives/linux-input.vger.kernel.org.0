Return-Path: <linux-input+bounces-14477-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8ACCB43B89
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 14:27:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B02A1723F7
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 12:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71AA82ED143;
	Thu,  4 Sep 2025 12:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UamV13yW"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EB82E92DC
	for <linux-input@vger.kernel.org>; Thu,  4 Sep 2025 12:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756988850; cv=none; b=F2uGFV+FfgVj9agvBUMi/ovYIv2v2vg02S++2g+FhSAy5OVy/jb55W5IIdAN8dSw/r9/hzkvAxRKVkazeQt5sVe86vcU5whzsbUok3Fx5hqDE/ioFJIVWjDGmu5eBER/mA9J7ODbt2K+BFS4qv8s0ObtcKx9TOA9kmmVzII+0yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756988850; c=relaxed/simple;
	bh=E6u7Hz5FM68nYpMU76wr6q7WaPDeKnL2ZOU679Zveco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gch2UODCULDKxkv4oZmj4AmlZ2YmCY1dkiPPKKdeJ4dqv8Ea9c2VPPcTbPc4SfuxRb8kVVTGa3Wuc+zAUzopuK9EBybkPuvDtXIwYYWatsrJgL309YaBH49oIxFSty0tDyy8S+7LIF0PjCsoraghemVyrSr+oRU2EQgPpgkj4CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UamV13yW; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-248df8d82e2so10273735ad.3
        for <linux-input@vger.kernel.org>; Thu, 04 Sep 2025 05:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756988848; x=1757593648; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t/OCBUETuPKzUnLWITAMnXAcmf7WC5D4vIH1XU/8rZo=;
        b=UamV13yWXoRMzF6hj8erZ7qfwgsD+6gdHXsPEyDXtiLu1oRze0GLYPOWtyG79Dao+I
         HJWoqZZ3blBzNpTQtrG8w8Cch0/EMiBzivFnLwmiiAesTNhd8AfXqcoH+do6gGePI1fh
         PkWQKO3sXvby6WdiJ5qTdNXRsIO+3Nb29w+NdOdYgktapN9errf/7o4Yz76pO8Kwvc0x
         4IKMX80xXlwPkEp499cGVcua3FN34MM7Fg9e7XupQbo1sr2xtUPRwTOnifjN40v+W3ON
         +hTVF8Hka4O06y78G6n9GB9dhNF9cLwhX6h2FwuhsZMoZ2ZP/zjca/u28MSgF8q9DNCJ
         jqEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756988848; x=1757593648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/OCBUETuPKzUnLWITAMnXAcmf7WC5D4vIH1XU/8rZo=;
        b=VEel1SObvZ2BYy/1WogyMGBtPLyMUuNjM1ny0cUGXxZY4dHOXlAtL+/Kdbp4Obkh3N
         HiKcnbsHCl8rU9BS8a1OtJR2X0lbwHugqyDYIqhy/+9xkwHcHrE4Z12RnqWmbSY51W24
         rJ2KTo16dNBEXaxJ1vWioh/EMR6cPM+opprtyX1SkOKxnSEjFNk/32qB1rtbgB7oYXA4
         SMv2i56qATZYU5zvTmMtiGx1BO1F+0navd1FfNiAozV4RWBDRJ77EAeN5RSqoIaDBVdc
         IMFf0E2M5xIWFy2EXbEYaWE2b/S7zjvI6rshYgkKjPwQC7K0eqncOHPl0clZPV4V0u4i
         VAcg==
X-Gm-Message-State: AOJu0YzKoOX4ljuIS8PRs+SXkKLV2s2AEYPwj3dNMSYLCiiIb4fcVQtB
	uqfy4e2XPLPD49DavgAzrUkERlPRsk6sEUlqfc+CkT/EUTveTd1DgYwWa5BDxjvv
X-Gm-Gg: ASbGnctw0F8rFmgtxckoJNx7FQKo2SHqwD34EX1ToCTyOm6ZQkpaUIFufh1iV331Exx
	Bdkjpz7T/KnmtFFI7lf0i0q73lt+zBHQVojz+DFDyB1uH3xo2cUMpUc20g7xM42N+x9rXFIUF0Y
	fOZ/bWxISnyGeU5V3y3Gr5bO8mFjdZ4BL43n7TDA59bdvM2bkhiPga3Ns4toi/v6VLop0qBiIEz
	zn/KX6oqdA75NGzewY5rvggXTadkVX2Z1n0i8++4OKJYz+pxdPXH0uz40OpqBaTzYV+JzJbOj6I
	hYUCfuzfF+Tds37XsDuEpl/V4Q3o6VryTkaEex/ZaFfLHcwES7ifoYhY7Ohm9fxH0H7GsvKa1WK
	Hw+RoVD49N+KWyMDIYk4Dqi3TVMhAnDLiVg==
X-Google-Smtp-Source: AGHT+IFqK8sJpu3WBI+Ne4wPB+Bj9L6a/8TZBHR7uE0nGDCULtjb6rp1HphDyz9bF40v448XrLfrfQ==
X-Received: by 2002:a17:903:2acc:b0:24c:cc36:ad92 with SMTP id d9443c01a7336-24ccc36af60mr27027845ad.12.1756988847927;
        Thu, 04 Sep 2025 05:27:27 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:463b:8ef9:3432:4c09])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24cb28c3147sm28316445ad.73.2025.09.04.05.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 05:27:27 -0700 (PDT)
Date: Thu, 4 Sep 2025 05:27:25 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jeff LaBundy <jeff@labundy.com>
Cc: linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: iqs7222 - avoid enabling unused interrupts
Message-ID: <xfon4i4naxtm45ibicni7qjpuz5q5uund2r6tr3k3hkgisqrpb@tqlgyib3vhoh>
References: <aKJxxgEWpNaNcUaW@nixie71>
 <jqtokes6treccrh4xuawyiidydhsitpl6kbyqov2ge2vroklrn@ly7uxtl6fnbf>
 <aKsvMswOOSIaCKci@nixie71>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKsvMswOOSIaCKci@nixie71>

On Sun, Aug 24, 2025 at 10:26:42AM -0500, Jeff LaBundy wrote:
> Hi Dmitry,
> 
> On Sun, Aug 17, 2025 at 06:00:46PM -0700, Dmitry Torokhov wrote:
> > Hi Jeff,
> > 
> > On Sun, Aug 17, 2025 at 07:20:22PM -0500, Jeff LaBundy wrote:
> > > If a proximity event node is defined so as to specify the wake-up
> > > properties of the touch surface, the proximity event interrupt is
> > > enabled unconditionally. This may result in unwanted interrupts.
> > > 
> > > Solve this problem by enabling the interrupt only if the event is
> > > mapped to a key or switch code.
> > 
> > Should I tag this for stable?
> 
> Thank you for checking; I'm sorry for the delayed response. Yes, I
> think it's fine to tag this for stable.
> 
> I didn't CC stable@ originally because I saw this patch as more of
> an optimization than a bug fix, but it's low risk enough that it's
> fine to include in stable kernels too.

Applied, thank you.

-- 
Dmitry


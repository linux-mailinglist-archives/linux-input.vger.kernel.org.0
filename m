Return-Path: <linux-input+bounces-9720-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACB5A25E70
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 16:21:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB1D118854AF
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 15:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D714B20A5C7;
	Mon,  3 Feb 2025 15:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MY3sFuEk"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660A920ADC3
	for <linux-input@vger.kernel.org>; Mon,  3 Feb 2025 15:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738595849; cv=none; b=ZL0yd4fp8Owx9mtNzShePWtxl5biljBEahpG9xzwdQFCLl/sV0CUwFSS5wSeGxdkzssHeZ3+GC4Zy6JExuzhhjXglmKbwFvvAdzusrlqNAyrKOLW8bkL3qvPJqEdaEHmn4lFJeQHNMyhkMQ7h0coiiTcAA5XvMGRcawEFLPyb6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738595849; c=relaxed/simple;
	bh=bekz0XApIv74cpOoC4Am1/Tqkqdo/93rwZC2mfNgF68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dhPbHjEkGgWkh0X+W4vRWnI+8u9rxRNj9NNSFk0q5SDGukbCkny6ilzO4uSSEHBsulRbLfJ5w0I7Xy7oM0V6Cu2Ze4599gx1rtDJz1bFFkQ3XC41RnvnxdAQlxW3FdmWa9BJrD8tR8Q1cZL6fvT1kmhspV2NAih5GvaL64Sm+DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MY3sFuEk; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-218c8aca5f1so90785195ad.0
        for <linux-input@vger.kernel.org>; Mon, 03 Feb 2025 07:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738595848; x=1739200648; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0o94amsTW41kZt8E5hxjCKR0Mgm+QV4b36Do2KSmt7o=;
        b=MY3sFuEk9tE+dF9VF4SXHZ9eiVoxHiu/HUAkYAWyD1b9cuGh2bcxp8JhznWtq8q3X7
         6fGB24Ow89An/VCETEuGs9/jBLQh50J5nENc9vOajUUyryNsC/Xtdb6zUuLA/xAa671L
         fynCTWTIxDIgntM6bplrDxKR8hEkO4OEfWBoFwXLvg5yrq/qOSxGsVsQcxp1o88sHP7K
         nBno/Ms8VqZjEAN/PQsp3mrHsA04GDf2KBwvyKTrSdw7RVcasz65VwBLm/QlGgvgKpId
         baaYl8inxAoyFX6M4iO3v+IeA6Pg1wt/BPC+0R3f1wK9ZLt5OB4wQN8I7Hnn5k+nymDq
         xWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738595848; x=1739200648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0o94amsTW41kZt8E5hxjCKR0Mgm+QV4b36Do2KSmt7o=;
        b=JehZV3hnRQon9WxN+ljhRRVRpHH16ohBM0cdU8fXQDee+7dGforaub0TjYdok2roAw
         zugC2E1xvgxGgWB10yy9+8GpwbXDjBZGhOiSIO42CZpnC2eAE5Mviprx436WR4JhhN+W
         RbopyEBbVRDZxISQZgn07FXxojKz1pbi4KafPAXwqYZ+80RXA0+9pUB2ltRz4FH31CbU
         XnBlVVkLYMvTihOhVwk5/1rHqH2T0H6xAL9BEGo96VLIGg2Cca7Edm9HQ4cBSQr48IRm
         sYT2titMLFoxS4Tyd7Bk8HsFiOzZ83t6LtSz8Ys24XSFyR6OfVPtrKukQ5hMVGjA8BJq
         QB9w==
X-Gm-Message-State: AOJu0YxstzBqA687PcI3zIwjbUw0dIuW9V1dvKUzYb5nbHGfUBe08hAp
	LTEZcXrumDCGyqTnx9IB+lGIumfsYPy/6+ZghKLInoBQq2kf9u/gzOEh9Fct
X-Gm-Gg: ASbGncv/HXXkpRJ/EVEW5tZs3v4IaqdC7z+gwLQIGE5VPaHtzA4gbItYVsKwXzB2RgW
	rlztqOgs9Cog4t9ofRj3KRuzB6ww78m51MJUaLZKHzIizCGsyHT29au91XiGaTSpE/HP7IcGDDl
	uagFN/G8++t8azPz2M2un6hiy1ZkDJP8PVcIIFeixr+GFNVOMdCEFxUKlaiPLtKdy5V+PmzkJF9
	A9o8sUwp4d9CAjhSUJIHTBTRjt41p5Ua6MnEN2kwLRCp+AlvYBttqksVGtl/Wo9PLswhJDflCQV
	QyHqqcKaZBtVRZdh
X-Google-Smtp-Source: AGHT+IGZUC1Z8J20TRPn5/HsrgR3Wtkx5lnzGfZTyxk2bcO8iLZXYX/KXKHDQwGFPuw1D0HewPQEnA==
X-Received: by 2002:a05:6a21:78a5:b0:1e1:becc:1c91 with SMTP id adf61e73a8af0-1ed7a5d547emr36544412637.28.1738595847593;
        Mon, 03 Feb 2025 07:17:27 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:bc03:a12b:a196:21f1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec0477a91sm8030936a12.56.2025.02.03.07.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 07:17:27 -0800 (PST)
Date: Mon, 3 Feb 2025 07:17:24 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Nilton Perim Neto <niltonperimneto@gmail.com>
Cc: linux-input@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH] Input: xpad - three devices added
Message-ID: <Z6DeBMCHLJlez523@google.com>
References: <20250122214814.102311-2-niltonperimneto@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122214814.102311-2-niltonperimneto@gmail.com>

On Wed, Jan 22, 2025 at 06:47:07PM -0300, Nilton Perim Neto wrote:
> Added to the xpad driver the following controllers:
> 8BitDo SN30 Pro, Hyperkin X91 and Gamesir G7 SE
> Also changed the VIDs to better describe them
> 
> Signed-off-by: Nilton Perim Neto <niltonperimneto@gmail.com>

Applied, thank you.

-- 
Dmitry


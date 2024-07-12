Return-Path: <linux-input+bounces-5000-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 344E192F636
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 09:29:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64BD01C22BA9
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 07:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87C5513E020;
	Fri, 12 Jul 2024 07:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wm0EYVdL"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6078213DDDC;
	Fri, 12 Jul 2024 07:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720769373; cv=none; b=p3RQUMsbxCoAcFOrtv1AxdZTxc04SKJC/IBvvPIXpZRtPkiEdeujn9QXjF7K/oyx6ZA7RgIQ0yw+M1NTUssYKSyJFtM3hrSwUU6a2jjUOVC+5QPArVFdpnRmLeXzyYsC3/AnXx+cYCE7ywf5AeeNWdxHri6jTrMdm8hYg2ZI5rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720769373; c=relaxed/simple;
	bh=A7mJ7JcFhqWeRznjemaLn26vFsVfhqppEbAuIVC47HM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M0foX4MoXxajINrXb/O4yCulx47kWyUspKQ1Qu8GtAVz79LOAePPkIJe9upfINDP/5NMCuZGC4A+YYROmPe9hI82OKeY/PhL79GYZNcCltv+pNdmtFmb7aB9GrLENUPued7l8Ubbp0ucvszc7Cn1upUuAH64yu3wHWvogbgPHgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wm0EYVdL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92FC8C3277B;
	Fri, 12 Jul 2024 07:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1720769372;
	bh=A7mJ7JcFhqWeRznjemaLn26vFsVfhqppEbAuIVC47HM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wm0EYVdLiKuWFurHsVWZ4P5kybMn43HeE2VMrRYMnUlBPxZf+twGx1WWsovvpYUE5
	 VsIFFySu+YjC2SmMQIJKpF+cBOj5HM2VseIkeuLD60OKaV55vGhuc98YkTcvOduN3X
	 0doyZCwgc9eEumDKXFJrEYy+Up8nWAaLDeT443gQ=
Date: Fri, 12 Jul 2024 09:29:29 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/8] Input: usbtouchscreen - move the driver ID table
Message-ID: <2024071216-widely-afoot-cd58@gregkh>
References: <20240712051851.3463657-1-dmitry.torokhov@gmail.com>
 <20240712051851.3463657-3-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240712051851.3463657-3-dmitry.torokhov@gmail.com>

On Thu, Jul 11, 2024 at 10:18:45PM -0700, Dmitry Torokhov wrote:
> Move the driver's ID table closer to where it is used in preparation
> to it using pointers to device info/parameters instead of device type
> enum.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


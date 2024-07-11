Return-Path: <linux-input+bounces-4962-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C455F92E115
	for <lists+linux-input@lfdr.de>; Thu, 11 Jul 2024 09:44:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B4EA1F21F31
	for <lists+linux-input@lfdr.de>; Thu, 11 Jul 2024 07:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9723D14BF97;
	Thu, 11 Jul 2024 07:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ckXpg+OC"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E49D14B08C;
	Thu, 11 Jul 2024 07:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720683794; cv=none; b=m7V1oqqKGM7QxzsxfnUkqq4rjEXbeAu5Y3+Gl5SYIhLg7IItgwmAoEB0fq1bAi05oGNqhVqcPUHCa6sk8UadExg+26fo/EJnJSJpn6hoGrva7o3VLku7ab4PXj1WdJ3zCG4/dPUgYkNYEN8IpOpKJwBYgjADAe1e0qBoWmUPg/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720683794; c=relaxed/simple;
	bh=4rr3BeIltZBvpbJeUaOclzD+tV7NVPW3GQ6Jp0nIkKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bEGOQauG5yJxcvO9qU86vn3vIuiOVYeCkBU6WElHzZRNQfdK/idv3O0/8LsQxxGif5rE7Z+v5bTNHRN63f2oRLKexzKzdDCWA4d3cgGB1rsZzbiBZMzpfSZjRVIxd7XtnbSK5UcDAMMAI616P2q6PBF80/kjzjjqvZ2zLV4zz20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ckXpg+OC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FC6CC116B1;
	Thu, 11 Jul 2024 07:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1720683794;
	bh=4rr3BeIltZBvpbJeUaOclzD+tV7NVPW3GQ6Jp0nIkKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ckXpg+OCvY2HbMGG6NXohqYM6siR7jC6iuj3U8mBzPrVWfBM5245nN3psVurW0cb2
	 I9073H3ngqZ3LgyeZES/zx4m7Q9kYoxgJvXDuzeyW5uc6cA4QCVLyrj+ie4ptK06Yi
	 qdZVM4Z7uX31U++Wi2XAOVeVt32NohO7CwtWAEXo=
Date: Thu, 11 Jul 2024 09:43:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Nick Dyer <nick@shmanahar.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: atmel_mxt_ts - use driver core to instantiate
 device attributes
Message-ID: <2024071106-tibia-impaired-dfe0@gregkh>
References: <Zo9kSFeGOZB9b3rq@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zo9kSFeGOZB9b3rq@google.com>

On Wed, Jul 10, 2024 at 09:49:12PM -0700, Dmitry Torokhov wrote:
> Instead of manually creating driver-specific device attributes,
> set struct driver->dev_groups pointer to have the driver core
> do it.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


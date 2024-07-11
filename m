Return-Path: <linux-input+bounces-4961-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2601492E112
	for <lists+linux-input@lfdr.de>; Thu, 11 Jul 2024 09:43:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1BF51F20FA2
	for <lists+linux-input@lfdr.de>; Thu, 11 Jul 2024 07:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D14BC152E05;
	Thu, 11 Jul 2024 07:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="t9ltvkmE"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02891527A2;
	Thu, 11 Jul 2024 07:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720683786; cv=none; b=ORUtLIpA/5y48bI8udfNw0uTK5+trPrYuLtY1TOtYIT5Vhdm1kj0p5vyLxaBGUV94FnDYqNycz5QDGLvRjwNFcZB121KZTwVOY3eFcSs91+CpUzCpgA2Qc5vX8ocH+c/kcKandIhwtgPpXvwHE2Q/pVusFSx0gKLn4/993RFbNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720683786; c=relaxed/simple;
	bh=Zkpfh5HN6WGzg2/em5enIHrHv9p6c84CWHRNY9PWRFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tk5IHajafkZUOuqzB/kvcvh2r/0uviF6zGBPKacW773nTEZu3XI7SfJsRhx9UtEAHQ8BAsku6+hQJ7S00IGXQy448orBRUN3y0kXdD59+OhWQaMvcoqRJpYaX+BiX3VmvLErfAi6w8Zomu1HFssIFbzqQAvMPqGCRDeVXrWtdOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=t9ltvkmE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DABA8C4AF0A;
	Thu, 11 Jul 2024 07:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1720683786;
	bh=Zkpfh5HN6WGzg2/em5enIHrHv9p6c84CWHRNY9PWRFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t9ltvkmEhqg5n/dH9Eah5wzVYlYjl2oBK9yIOAmqZ8xkKdYGHBGAHbSKoNSRcJQ1j
	 PNAZeV9/0zGD7yMK57IR7ss/fXOwvJciE7V74lCuO4tKxlY25sP4B44IbhgYWQk2ZM
	 hWiy7gTI0ksKW6WmHUs/dEzGARDtXbY17+NKbIMM=
Date: Thu, 11 Jul 2024 09:43:03 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ville Syrjala <syrjala@sci.fi>
Subject: Re: [PATCH] Input: ati-remote2 - use driver core to instantiate
 device attributes
Message-ID: <2024071158-patriot-encourage-4e48@gregkh>
References: <Zo8gaF_lKPAfcye1@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zo8gaF_lKPAfcye1@google.com>

On Wed, Jul 10, 2024 at 04:59:36PM -0700, Dmitry Torokhov wrote:
> Instead of manually creating driver-specific device attributes
> set struct usb_driver->dev_groups pointer to have the driver core
> do it.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


Return-Path: <linux-input+bounces-13902-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A01CB20803
	for <lists+linux-input@lfdr.de>; Mon, 11 Aug 2025 13:39:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B4AB164D4D
	for <lists+linux-input@lfdr.de>; Mon, 11 Aug 2025 11:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8794F2D0C85;
	Mon, 11 Aug 2025 11:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BeST76Bg"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2CA191493;
	Mon, 11 Aug 2025 11:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754912343; cv=none; b=QwmGtPL0ahI3NhJ8EEbXvyuczCAfnuzW948doZXp6zKGbgw92f1tJ5VU2wH/o0oL+SAIDjrdood9HYkl9QvzwuTvOG5DqyZyOmqA/Sn/ECNZU977pCr7m+pnZWLXRDThU/BRAl/DHfNN5wPw2LrpjuyTs5Tn2hF0BwkK5yKJWEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754912343; c=relaxed/simple;
	bh=nxzasvokZUTvEwIkIttlFs2/bLWUGFwww6pz1b7Avic=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=lexRsimazg+QoVdFdbOZTEXhx5w0JfWpVi9XDRVuFmLkwkDs7/4BeVaaEj+9xzvp4VpKkLMQ/gcXKThnnVU7vFBkf+dDwG2l5knzOH7eDL8nksgvsxmhvoyqq4s2mMTi3pF+v78Tx29Gp8gVdUpasdbLToVerh10LJs1JrRdJAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BeST76Bg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C1E5C4CEED;
	Mon, 11 Aug 2025 11:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754912342;
	bh=nxzasvokZUTvEwIkIttlFs2/bLWUGFwww6pz1b7Avic=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BeST76BgId7QNCcFOQaZLgzbDSF2+xqAasxshukkX9W7lo8EaqYboUb+lTFlxumJ5
	 +ZVVzKtTKL/CE4Vj1DY8l2slXVRCpsNL74g9nMd+51CJglzf1Ht8xiQo9QpwUcODCq
	 wP3FNX4dWZXhXZKOjMD/mwhGadhDGdkXbZYewvjyl55aXYTMnlb7n5dtVCT+5Zs291
	 XD03J15amLcPx7DAQWI53I6DidpGIYCF0BDg6FH+EIynNsxnZkQIGk7YMOSUMG0Fhq
	 eG/1hQoK4Lic7eeXbzP84gpBvXznPCeXvksb7i0rwK1ECtkW/uSihT1U4uuJ0xAZJl
	 eU2EJ3iFMch1g==
Date: Mon, 11 Aug 2025 13:39:00 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Aaron Ma <aaron.ma@canonical.com>
cc: even.xu@intel.com, xinpeng.sun@intel.com, bentiss@kernel.org, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] HID: intel-thc-hid: intel-quicki2c: Fix ACPI dsd
 ICRS/ISUB length
In-Reply-To: <20250803065726.2895470-1-aaron.ma@canonical.com>
Message-ID: <qosrs9q2-6qrr-46r7-7nnp-s1nr1o265885@xreary.bet>
References: <20250803065726.2895470-1-aaron.ma@canonical.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Both patches now applied to hid.git#for-6.17/upstream-fixes, thanks.

-- 
Jiri Kosina
SUSE Labs



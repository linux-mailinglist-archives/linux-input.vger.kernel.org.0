Return-Path: <linux-input+bounces-14372-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF46B39C3A
	for <lists+linux-input@lfdr.de>; Thu, 28 Aug 2025 14:08:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36B273BBC79
	for <lists+linux-input@lfdr.de>; Thu, 28 Aug 2025 12:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60FFF30F55E;
	Thu, 28 Aug 2025 12:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A0G+kjuz"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F3330F559;
	Thu, 28 Aug 2025 12:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756382865; cv=none; b=RUB3Rn2nV4d9Ud/fJWstztwAaDn+wW+xIHdMgKQgcVFMJOCKyLIrDKQ5WR6yjEV6Ggio+cTcbsbKuU4jz+ELTD+78a/U9odxoqJjBJ0ycM/rz9tV/G4NLgcLWn8lPFllEe3ikY3YOkmO51R9rm9exx+AYd8UwgEYT+hx4TohX+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756382865; c=relaxed/simple;
	bh=8Q533SWLzqRqrfQgGDXYBsrfojs7gXYhZ/HKvcoKw8w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SERi6mnClNsDmkUMtcUSHXj+GL7MI10ItzZivCTDGdwr36j3YJsWD3J1yyZSUqV4Cri3NLQtni/TjNcM+SY5pDlVev7mgsdgb6hpHKOepKbtG3gQPeRtyUzwGguitzChspsBmQMgiwmBr8aE1qeN13mp1NY7cusJV39ptRK2PbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A0G+kjuz; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756382864; x=1787918864;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=8Q533SWLzqRqrfQgGDXYBsrfojs7gXYhZ/HKvcoKw8w=;
  b=A0G+kjuz5CJ0B6fqZv34g+ddOYM/yKWLtew4FKNDsFHoEvedrXV36tXi
   uNnraKfPywbbwjmGtLvTtYWITrH9PK/pLoKPRWtMNsYP3SQ7HcYTa1GPW
   qCafc6nTVTqK+TAQDSO28skRWn1NBiTDdUuvDPTyw0IIpnrm+XyPBPEwM
   yZAuvXq5S+b2ntShHGBzOmFrE3w4CMaB6wuA1vpRJCwfyVDkL7cRHNFUG
   zDPbwx+2mK1sZlnJB/L77trpUUfxbzB8BxOVLSocQD87J/lxCLEdArS7O
   bvZ2KvP2ylWmwE5Yl36jFibfSo8+QfghmQp6awsomylQiHbX5/xm0nmuH
   A==;
X-CSE-ConnectionGUID: 79Ck7qa3RdecMARPKEADog==
X-CSE-MsgGUID: PqkKIX+qT7ivsum29CtWyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="61283466"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="61283466"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 05:07:43 -0700
X-CSE-ConnectionGUID: TBFA6ZxCT6CXWzE5F+re/w==
X-CSE-MsgGUID: HcW5xG5lTx28+Qsf3fSQxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="207245326"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.99])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 05:07:40 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Gladyshev Ilya <foxido@foxido.dev>
Cc: w_armin@gmx.de, linux-input@vger.kernel.org, 
 nikita.nikita.krasnov@gmail.com, Armin Wolf <W_Armin@gmx.de>, 
 Hans de Goede <hansg@kernel.org>, linux-kernel@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org
In-Reply-To: <20250820174140.41410-1-foxido@foxido.dev>
References: <20250820174140.41410-1-foxido@foxido.dev>
Subject: Re: [PATCH v6] platform/x86: Add WMI driver for Redmibook
 keyboard.
Message-Id: <175638285480.13908.15870392033093887449.b4-ty@linux.intel.com>
Date: Thu, 28 Aug 2025 15:07:34 +0300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 20 Aug 2025 20:41:32 +0300, Gladyshev Ilya wrote:

> This driver implements support for various Fn keys (like Cut) and Xiaomi
> specific AI button.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: Add WMI driver for Redmibook keyboard.
      commit: 98aadf8e494d2bf66b15d0ef9646ad9fdb6ded15

--
 i.



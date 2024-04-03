Return-Path: <linux-input+bounces-2785-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64066896E02
	for <lists+linux-input@lfdr.de>; Wed,  3 Apr 2024 13:22:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 034FB1F23C55
	for <lists+linux-input@lfdr.de>; Wed,  3 Apr 2024 11:22:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD3F4142E7B;
	Wed,  3 Apr 2024 11:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qhk4/Xye"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890E6142E78
	for <linux-input@vger.kernel.org>; Wed,  3 Apr 2024 11:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712143314; cv=none; b=KwedoBiGM8SbXK63KB5ow9vQxNVa2jfCcHsKTmJkl7TRdy/VHWwC2fcfooTUe2m2cr2eF+hsEXn8Kq+TgLqAYHkeTzUxabxMMHdtaUsB+yaXLhSd3KjsW8AraCBR1E8pviGbWgaTjNTw01GXfz4dy4HcEyIT0MkELR63FHX72+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712143314; c=relaxed/simple;
	bh=eE0PN7ZpqtcBonk3R4RVr9FW/N8RRT94nj9mO30rnUk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=lt0Dzi7UQW1nFMEXkamCxcGD5Z64U8W48kAKH+TuaxuHXYFTWjL5S+kLQR424D03aNiQQoOV3NAqrrLEYtydJQHWTCXeUiylgyjxYAFX89x1G4MKUdKpHl06EY7sTy9AMWfacjKZNDAmCNiKEuL2G+JzqtvwBirN1a6YdABqdss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qhk4/Xye; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC368C433C7;
	Wed,  3 Apr 2024 11:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712143314;
	bh=eE0PN7ZpqtcBonk3R4RVr9FW/N8RRT94nj9mO30rnUk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Qhk4/XyeDJn8OqW0RuQp2BUSLaPnPVl9Z8Oa61rYz0N85ZwPQSqxusAA/cRFBOB+F
	 ve8T/5kZEA0pd+dpLf2tdwfz6trRfZu4hvQNX2Ec8ri0f7MK0uOdqERkhR6wuv4QLf
	 jp/vk14PNUXgxPA34gt1d15BMf8uezrHsGz5fW5r/i3DZIG/nmdAc6KJe1cUGz/Yhz
	 ccatJ5qCaOCbeCb0Y2rR5z53zC9l/r4B5XObb0GzXBWEVqxAGflqQaYZTxltFvvAFi
	 45jTwXN9AxaiR1npglblOhOevLn+kx76w3sYRM1XkcqlckfKIxkeenJMNXBbjpVsSP
	 Z64FLDq6PzJrQ==
Date: Wed, 3 Apr 2024 13:21:51 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: "Zhang, Lixu" <lixu.zhang@intel.com>
cc: linux-input@vger.kernel.org, srinivas.pandruvada@linux.intel.com, 
    benjamin.tissoires@redhat.com
Subject: Re: [PATCH 0/2] HID: intel-ish-hid: ipc: Use PCI_VDEVICE() and add
 Lunar Lake-M PCI device ID
In-Reply-To: <20240306005638.2781839-1-lixu.zhang@intel.com>
Message-ID: <nycvar.YFH.7.76.2404031321400.20263@cbobk.fhfr.pm>
References: <20240306005638.2781839-1-lixu.zhang@intel.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 6 Mar 2024, Zhang, Lixu wrote:

> This patch series consists of two patches. The first patch simplifies
> the device table by using the PCI_VDEVICE() macro and renames the device
> ID macros to follow the pattern PCI_DEVICE_ID_INTEL_*. The second patch
> adds the device ID of Lunar Lake-M to the ISHTP support list.

Applied, thanks and sorry for the delay.

-- 
Jiri Kosina
SUSE Labs



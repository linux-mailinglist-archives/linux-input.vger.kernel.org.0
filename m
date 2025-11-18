Return-Path: <linux-input+bounces-16182-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AF1C6AE0F
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 18:16:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BDB5E4F256E
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 17:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A075393DFE;
	Tue, 18 Nov 2025 17:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gucx3Hwt"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20334393DF5;
	Tue, 18 Nov 2025 17:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763485713; cv=none; b=ekN9Tlap09xBVK2AuvIUWGMl0eHP1oQnMvnTm1g5VUHDEHYv7EBkGFqD5eH2Dp2KoEQG63HgkyJ0b0a/OYK/EJbyDlndS0Etn2ph5xFcSu4EDutX9MHvoG4Kxh4QRrfCJ2O7dfDYiASURlm/lmQPea4DeXLC+u2eMxnVLNebeGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763485713; c=relaxed/simple;
	bh=VBS3UdL6QxCZPKRYQAFx05oGZHThkd0JR0XeUkf8+pM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=dHI63sQBITzXp0KRr31PcEQ7PwUJO0YvygxuU0dZQV54RDTHnRKpbOiFCHtwdW7K+xi1uL/bll4kazpXeOUs/Ga1OixIJIKKFzIQw4qLh8HZ6kPSnoEh5dNVOg2J1AevK2gNAhuHVhIL0zqlwhuhfqNsr65eHKIiA1ZWh8Cv1gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gucx3Hwt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9754C2BCB9;
	Tue, 18 Nov 2025 17:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763485712;
	bh=VBS3UdL6QxCZPKRYQAFx05oGZHThkd0JR0XeUkf8+pM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Gucx3HwtuZXvySRQw3/XgqpRsgV56VSbK0uOyF0PBVR0c+deGuhhoEf076NvISV0m
	 BaVbD8dx8LO7X4l/akCEnw816J0GM/dtW9yvug0O3MYM7O4Imcb4wNnzMjJTQvL5dS
	 00ld19xkJ0yI+qGTVPmFpxkp8X6v+ysxOGdmiDxQ9SvSc0S5vVvEcyQO+1mllfy4nN
	 a/a5cWuD4XqMDIwdpcdpePvSaZtPd1UHLP2lXjDhMuEe0KKA8R1HMuEurbJjellqqS
	 rhT8rBRWI5odtf6p3ArMTU5/UeCuk8hPKvfnYDImCATOCcag3jXMIuSNE/Ve/o8qwh
	 wTUbH2OzOqYGw==
Date: Tue, 18 Nov 2025 18:08:28 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Abdun Nihaal <nihaal@cse.iitm.ac.in>
cc: bentiss@kernel.org, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: uclogic: Fix potential memory leak in error path
In-Reply-To: <20251110172943.99887-1-nihaal@cse.iitm.ac.in>
Message-ID: <5p084qr1-0015-20q7-74no-s5345qnqn3p3@xreary.bet>
References: <20251110172943.99887-1-nihaal@cse.iitm.ac.in>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 10 Nov 2025, Abdun Nihaal wrote:

> In uclogic_params_ugee_v2_init_event_hooks(), the memory allocated for
> event_hook is not freed in the next error path. Fix that by freeing it.
> 
> Fixes: a251d6576d2a ("HID: uclogic: Handle wireless device reconnection")
> Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs



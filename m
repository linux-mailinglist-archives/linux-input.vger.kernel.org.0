Return-Path: <linux-input+bounces-10540-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC77AA4EECB
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 21:51:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C39518934FA
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 20:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CAD424C093;
	Tue,  4 Mar 2025 20:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BPsZgtIH"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEBB156C76
	for <linux-input@vger.kernel.org>; Tue,  4 Mar 2025 20:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741121502; cv=none; b=OlxHpsgOg6S/LTaoajTFRG+8T87xfLPgFLgQrrN+fdti9a3NTXMY2twonVC98gSCYM2Eo1KYjJaZGEs2y+6XO9cHqcIhHTVsGBWpBQal0W8ujYIy8nox1cAaRjbDUz7nuRXnyFgrzv44+SNoVwDmbd1hS10d10NbdjOCnhJdQF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741121502; c=relaxed/simple;
	bh=t6VaEwSSUm0cjCoT6p2PKdHSKYLFnBi8zIgRqEp9Y/s=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=W/x73hJ6iO/mFlNR1gGdyauka919MpfJ03019wfswKi08ER/bSAuJzZZa5/Dykn7nulclTyEVuAwoIGsjPnC4dIPffDQq0dKx/WQtbBrf66LAA2c74qynYamWfNMCEkAiYRnhNPgTFPbCImNGoMIgfh/Uwbxpx3UahZ/0I2h1Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BPsZgtIH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1094C4CEE5;
	Tue,  4 Mar 2025 20:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741121500;
	bh=t6VaEwSSUm0cjCoT6p2PKdHSKYLFnBi8zIgRqEp9Y/s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BPsZgtIH7s1NNAdSM04E1k4y+rRfY8q6bN3bLZFoRPEPiqbs9BATM6tpIrSwH5c4o
	 5YVBTbUxq34gaxVy4hZUTLAQspIl8oqrV/H4iXGhXbZGV7rOVg43+zfJPQPbcVxKi9
	 xn+bNPmzSyIX+i4i7rRXDRI1fI3br1XM5djEt5QJ229/pAKqPpwSBpGxyVeO/0RkEc
	 ZJRQcDo+RiiDfZGZSCMSU81zijW2vV3JtRIhuCqzvw7Dw1qOuJ/jmhX5nGDsoq56uk
	 laKMTwX99X80VUVnehAaEDR05WEEplip36MznQPhhL0udpc0EDOyXr2JUn+LyOFs4X
	 oIr7syjxvRFwg==
Date: Tue, 4 Mar 2025 21:51:37 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: "Gerecke, Jason" <killertofu@gmail.com>
cc: linux-input@vger.kernel.org, 
    Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    Ping Cheng <pinglinux@gmail.com>, Erin Skomra <skomra@gmail.com>, 
    Joshua Dickens <Joshua@Joshua-Dickens.com>, 
    "Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>, 
    Jason Gerecke <jason.gerecke@wacom.com>
Subject: Re: [PATCH] wacom: Remove static WACOM_PKGLEN_MAX limit
In-Reply-To: <20250303195518.8326-1-jason.gerecke@wacom.com>
Message-ID: <o3565q08-6n9r-pqr9-n74o-rro2647758n9@xreary.bet>
References: <20250303195518.8326-1-jason.gerecke@wacom.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 3 Mar 2025, Gerecke, Jason wrote:

> From: Jason Gerecke <jason.gerecke@wacom.com>
> 
> Rather than memcpy every packet that we receive from HID into our own
> local fixed-size array, we can just access the data directly through
> the original pointer. While we're at it, remove the few other places
> that assume a fixed maximum packet size and make them dynamic (in
> particular: temporary buffers created by the wacom_wac_queue_flush and
> wacom_intuos_bt_process_data functions; and the pen_fifo FIFO).
> 
> To ensure pen_fifo allocation has access to the maximum used packet
> length, this commit also moves the function call to occur a little
> later in the probe process.
> 
> Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>

Applied to hid.git#for-6.15/wacom. Thanks,

-- 
Jiri Kosina
SUSE Labs



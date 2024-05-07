Return-Path: <linux-input+bounces-3532-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C97E8BD8B6
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 02:50:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C9C51F248FD
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 00:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A2E710F1;
	Tue,  7 May 2024 00:49:55 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail.enpas.org (zhong.enpas.org [46.38.239.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3E5389;
	Tue,  7 May 2024 00:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.239.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715042995; cv=none; b=DG2aUz6EMtKwBs/D2f+H+sXeNpCGzbAKgGfkYDj9JAO0L9XofFt7MEDeYaKc4jPBHKS3Mkdfp1hWE15Irn0HZE20msIMXx8AkheBfY9qjcbjgebSP22F30r2OT6QWzR7D1IcRyObXAJaocwGVxWtimvSXIstkb4ZuZ6cDJvond8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715042995; c=relaxed/simple;
	bh=Rkwf+HH53PBe8IThDakfA+vpDQrCiG/LeR8Rkg3rohM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=psBOe/SRsRqZclMj2LpxBPb666QKxda9R8iUUW4pQyha6FYxuz8L5v3vVoMGer/0RrVIQMLDK3L8Eo3UCVPmUFwQEI1UD60RhizGYrtzOFHihRA/lBAky6bpZdM3/2WXl7ySMXt0H2+83Vvfmv7brAAEYHz3aKdlTNK4FONjJmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=enpas.org; spf=pass smtp.mailfrom=enpas.org; arc=none smtp.client-ip=46.38.239.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=enpas.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enpas.org
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.enpas.org (Postfix) with ESMTPSA id 919D3FF9C3;
	Tue,  7 May 2024 00:49:42 +0000 (UTC)
Message-ID: <09292780-b815-4880-8022-b905ea0042ef@enpas.org>
Date: Tue, 7 May 2024 09:49:37 +0900
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] HID: playstation: DS4: Fix calibration workaround for
 clone devices
To: Jiri Kosina <jikos@kernel.org>
Cc: Roderick Colenbrander <roderick.colenbrander@sony.com>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240504165531.21315-1-max@enpas.org>
 <nycvar.YFH.7.76.2405062331420.16865@cbobk.fhfr.pm>
Content-Language: en-US
From: Max Staudt <max@enpas.org>
In-Reply-To: <nycvar.YFH.7.76.2405062331420.16865@cbobk.fhfr.pm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/7/24 06:32, Jiri Kosina wrote:
> Now queued on top of the for-6.10/playstation pile in hid.git.

Thank you all!

Max



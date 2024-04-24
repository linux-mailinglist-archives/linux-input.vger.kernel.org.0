Return-Path: <linux-input+bounces-3251-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A598B14E8
	for <lists+linux-input@lfdr.de>; Wed, 24 Apr 2024 22:50:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E033284658
	for <lists+linux-input@lfdr.de>; Wed, 24 Apr 2024 20:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0BBE15689B;
	Wed, 24 Apr 2024 20:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=linuxtom.com header.i=tom@linuxtom.com header.b="XRuKGt65"
X-Original-To: linux-input@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D13B13A401
	for <linux-input@vger.kernel.org>; Wed, 24 Apr 2024 20:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713991835; cv=pass; b=HtFUttiZ8fMxoQYx28XecjAE2TGKNeV/CDlNxJvW0mmLQ5VS9pStWn53qbjsaeRb5e0LN3HdK9hSTngxb1OBjFSWulypXOWed44J0rQLhMzjUlnDkExYQarq2K+Bd1Sd6m/9EC9CiCHo8jbEHI2tYyP/hlq7TeR+PxlKISlxiy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713991835; c=relaxed/simple;
	bh=MbY1fBj4PGQlO/aE500kw8FLGCp9KSRYJHSrEaccOKg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=IJFj6OEW59r0gdldRdcQe0guvP1k9cnnDEJTRb6TbP/enMV51kBXCpFC1u7Vkb5mXea6W1+BR1dlQZSE19DEfBC2Oc0ETbWnzqpCZjjez6oBen1PEYzRX0xsNbGcTOCJ+z7fo6WhXdCSYrxGztaZMZaGlJCv/Yl5YVIFiI5ZrNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtom.com; spf=pass smtp.mailfrom=linuxtom.com; dkim=fail (0-bit key) header.d=linuxtom.com header.i=tom@linuxtom.com header.b=XRuKGt65 reason="key not found in DNS"; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtom.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtom.com
ARC-Seal: i=1; a=rsa-sha256; t=1713991833; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JelcwU2Tvv684QgorJfwnTHtFz4EYogiAr5LWrFNzAjNyL4RmTnmSZCzVxdJpXKBG8YllSJ0FnpU+mckP8LMxWT+e6gOfKsWhtpe/oKKvJpX/IW6jSIxKme2QGDCQe6zzAhQDNtyjNxb51Ix0swVBGSf3PYjRiH6DV6qpCeScQs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1713991833; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=0N5p+yZJzCxEEYhr5uiON9S6z/aUzwtATqT5pP7iD1I=; 
	b=g+akaWurOvD7fwdISHBdBQzjX+E0qDKNQVr86szTNBVcUBRhjbSiumkVM0Z+hQqxu98MBaUvDKm+r1vR0XIhw/d/D8YaU+uHqm0rJHPZmoScJOdjVftT8ymPk5PBLh5JXcrJEW9FiFfxVq8kraZaUb4UGDoULGrhZ/zvSM2OU0Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linuxtom.com;
	spf=pass  smtp.mailfrom=tom@linuxtom.com;
	dmarc=pass header.from=<tom@linuxtom.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1713991833;
	s=zmail; d=linuxtom.com; i=tom@linuxtom.com;
	h=Message-ID:Date:Date:MIME-Version:From:From:Subject:Subject:To:To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=0N5p+yZJzCxEEYhr5uiON9S6z/aUzwtATqT5pP7iD1I=;
	b=XRuKGt65ddr7tEG/2awH3qU0ItiqcwSL7GJ91BGOLOViAl6kirHZgemjtmDZqjjV
	ejhM8NGGt3N0X29RTbmFncB8tHnioMJ7kEHav6jHnEX2x4plHLXB9Ym7Ejmps1lkOtf
	G2ji8VgTrB3b6GSrRpwCibqjMxeVu610BsTUEguo=
Received: by mx.zohomail.com with SMTPS id 1713991831091333.0682520427424;
	Wed, 24 Apr 2024 13:50:31 -0700 (PDT)
Message-ID: <84dd7dc2-32f7-42f4-b10b-fd3d93f1a759@linuxtom.com>
Date: Wed, 24 Apr 2024 14:50:30 -0600
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Tom Aspenwall <tom@linuxtom.com>
Subject: Issue with psmouse Kernel Module and Trackpoint Drift Correction
To: linux-input@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Hello,

I'm experiencing an annoying issue with the psmouse kernel module on my 
Gen3 T14 ThinkPad, which uses an Elan Trackpoint. When I hold the 
trackpoint in one direction for about 5 seconds, it seems to recalibrate 
to a new center spot. Consequently, when I release the trackpoint, the 
mouse cursor moves in the opposite direction for about 5 seconds.

I've tried to disable this feature by adjusting the module parameters 
(resync_time, resetafter) through various methods including udev, 
modprobe, and sysfs, and even by modifying the source code. However, 
none of these adjustments have changed the behavior, though sensitivity 
adjustments seem to work as expected.

I've dipped into the psmouse source code, which is a over my head, and 
changed default values for the parameters, recompiled the module, and 
reloaded it, to no avail. I'm beginning to suspect these parameters do 
not control the recalibration "feature". modinfo does state that setting 
both parameters to 0 should disable them, but this has not resolved the 
issue.

I've confirmed it's likely a psmouse issue, having replicated the 
problem on a minimal system setup without a desktop environment or 
libinput, using only evtest. I even tried modifying TP_DEF_DRIFT_TIME in 
trackpoint.h out of pure desperation.

Is there any way to fix this issue, or could someone provide more 
insight into what exactly these parameters (resync_time, resetafter) 
control?  Also where can I change the length of time that the 
recalibration occurs.  If the recalibatron where a longer period I doubt 
I would hold it for the length of time it takes to trigger the 
recalibration, but 5 seconds gets in the way of fine control of the 
trackpoint.

My setup is debian sid, gnome on wayland, debian kernel 6.7.9 and 6.8.7 
built from source.

Thank you for your assistance,

Tom
tom@linuxtom.com



Return-Path: <linux-input+bounces-10632-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE871A57033
	for <lists+linux-input@lfdr.de>; Fri,  7 Mar 2025 19:12:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD5963AD0A2
	for <lists+linux-input@lfdr.de>; Fri,  7 Mar 2025 18:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54627241667;
	Fri,  7 Mar 2025 18:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dogben.com header.i=@dogben.com header.b="hMV7/VVb"
X-Original-To: linux-input@vger.kernel.org
Received: from dogben.com (dogben.com [172.104.80.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983F623A9A5
	for <linux-input@vger.kernel.org>; Fri,  7 Mar 2025 18:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.104.80.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741371161; cv=none; b=bJxfU//bLMFqKZQpGXfjD6VXKFuACOSLvpZjOLdyGfGEM2TLdc/8SGasLevfsK7dw+rEPvkTGqBzIBb+Ho03ndq4gRePUTu8J3PWaJ6Bi3kSD7GAyc4seeAGb0oUIW3d3yxx5pA0clllhiiRpsUDXx4CG40PIusyWptrBR3qFKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741371161; c=relaxed/simple;
	bh=fBQAKzhadcmq+WnW8wvDq1K4uJm+cJ8ZR5SNzx5R6e0=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=nmhOyPp2ZjwRI7q2OdcLPyglC9ozF7J75lW5ybTjoWbRUvfdbNSbGZs3iubEWeJNzR89Ig9uFBQx5x3GTeUtFSRxln5esu7thuLPQnH7Cd5ux6vHGLa9iiz8PpH44wwHMWvKO3+htxqzPxwu40LaqDTdFfYGgr9SlvIgB3dvBLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dogben.com; spf=pass smtp.mailfrom=dogben.com; dkim=pass (2048-bit key) header.d=dogben.com header.i=@dogben.com header.b=hMV7/VVb; arc=none smtp.client-ip=172.104.80.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dogben.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dogben.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dogben.com; s=main;
	t=1741371158; bh=fBQAKzhadcmq+WnW8wvDq1K4uJm+cJ8ZR5SNzx5R6e0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hMV7/VVbFQouBP5xon1rOCl6UwFnLx1tLCG5pnAv/G7z7gpEkwgiIsxrz02bKC0AZ
	 cWx4v6QplMMIb3YPMqWGEEYt0q5ra1HOneMSuaFwvt4YK2py/pVbef9SVAjkEDCtJI
	 bbvPcwZjkZ+qizx/6xQ3kEuOdU6zcumYWoPmQiMj6xpit2/rQs2hCj+N+JmzUnSwt8
	 OD37LKMQ0WJw9eSI3Dk2CEScrfsXk9TQjOUQMXO4sS/evqUvfcDorcDi/+JilA/cZO
	 UKw9aEzGYM7/MSbqRPnPKf/FIKNqLoqFR1WM6x+pdqwf1D5T5+9Q1t8677m/cxBI8T
	 gVhcXqxED2Mpg==
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 08 Mar 2025 02:12:38 +0800
From: Wei Shuyu <wsy@dogben.com>
To: linux-input@vger.kernel.org
Cc: hdegoede@redhat.com, hadess@hadess.net
Subject: Re: [Question] Dependency of goodix_ts
In-Reply-To: <436de91e118c328c62edc316c7f68940@dogben.com>
References: <436de91e118c328c62edc316c7f68940@dogben.com>
Message-ID: <c41f5ed66eae96b7ea37a87a78cd27bf@dogben.com>
X-Sender: wsy@dogben.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Problem solved.

I thought the touch screen is connected to the smbus, but it's in fact 
connected to platform device AMDI0010 which requires 
CONFIG_I2C_DESIGNWARE_CORE and CONFIG_I2C_DESIGNWARE_PLATFORM.

I hope it helps if someone encounter this later.


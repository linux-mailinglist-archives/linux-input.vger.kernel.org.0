Return-Path: <linux-input+bounces-21-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A33D7E9269
	for <lists+linux-input@lfdr.de>; Sun, 12 Nov 2023 21:04:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDCCE1F20ECB
	for <lists+linux-input@lfdr.de>; Sun, 12 Nov 2023 20:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F9C018047;
	Sun, 12 Nov 2023 20:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gnu-linux.rocks header.i=@gnu-linux.rocks header.b="QAtdUVWo"
X-Original-To: linux-input@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7372018048
	for <linux-input@vger.kernel.org>; Sun, 12 Nov 2023 20:04:21 +0000 (UTC)
X-Greylist: delayed 358 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 12 Nov 2023 12:04:19 PST
Received: from mail.gnu-linux.rocks (unknown [82.165.184.165])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 701F91FFB;
	Sun, 12 Nov 2023 12:04:19 -0800 (PST)
Received: from localhost.localdomain (ip5f5be8be.dynamic.kabel-deutschland.de [95.91.232.190])
	by mail.gnu-linux.rocks (Postfix) with ESMTPSA id E1D4E3FF28;
	Sun, 12 Nov 2023 19:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gnu-linux.rocks;
	s=mail; t=1699819100;
	bh=KnudzStFE2cldjxqz5zKtdvJz6QG1VHUiZ8lWW0Ruos=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QAtdUVWo2B/VWIJI05/4KZSRLuEU0oqRpj9EhPT96wrlnAUbAV5kfnMSeDjIfcYg6
	 pj7AIQppKKexu0ByJx7d3ZRggX3HGSB02tU8YmPTr9B8FbHMNiRssFBw+PkEP28F7H
	 TqwkGH9PRniynS1ZVNlcTT5tn59he7UqoJpIPghSdE311fSlO2Ikvr0B8wOG/NCVH4
	 jN0MzmoSZWibi8/lMDTmlqnNC9XHq7/OgdXGWb1FEzlVF/6ArvUsTeeRF6ALjhw6c6
	 8Z37jwxJvMWyefB9e0UQps26Q4RG13xsXYQig6Yei/MlN/6vQ+G+lxT79s/X3v53pQ
	 grJKNVjXb506g==
From: Johannes Roith <johannes@gnu-linux.rocks>
To: benjamin.tissoires@redhat.com,
	jikos@kernel.org
Cc: sergeantsagara@protonmail.com,
	andi.shyti@kernel.org,
	christophe.jaillet@wanadoo.fr,
	johannes@gnu-linux.rocks,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rdunlap@infradead.org
Subject: Re: [PATCH v7] HID: mcp2200: added driver for GPIOs of MCP2200
Date: Sun, 12 Nov 2023 20:58:12 +0100
Message-ID: <20231112195812.243155-1-johannes@gnu-linux.rocks>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <87r0mqhlp6.fsf@protonmail.com>
References: <87r0mqhlp6.fsf@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dear Maintainers, 

my patch has undergone review by Rahul Rameshbabu, and I have addressed the feedback accordingly.

I understand that you all have busy schedules, and I appreciate the time and effort you dedicate to maintaining the Linux kernel. However, I would be grateful if you could provide an update on the patch's status and whether there are any further actions required from my end.

Best regards,
Johannes Roith


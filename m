Return-Path: <linux-input+bounces-13391-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F9BAFA138
	for <lists+linux-input@lfdr.de>; Sat,  5 Jul 2025 20:48:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBE614A086F
	for <lists+linux-input@lfdr.de>; Sat,  5 Jul 2025 18:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 157382CCC8;
	Sat,  5 Jul 2025 18:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sjohal.net header.i=@sjohal.net header.b="IGYvZ/j5"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-bc0a.mail.infomaniak.ch (smtp-bc0a.mail.infomaniak.ch [45.157.188.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4F71BF58
	for <linux-input@vger.kernel.org>; Sat,  5 Jul 2025 18:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.157.188.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751741305; cv=none; b=ec15NarD//wxDHzKY1OR6qjHKII7WZn/MhmlFjXtmCLMMWnquxbE+laUCmyabCnFcu5wAI6NNFrRBg9ZwwdiXR5e5zLGopqzyTbTEMsHiexfo7EITQrCHuqG3y7GUTgx+l1YSq+qP+mVHEyaRx/mWCAojGtehCd0jk76nQc91pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751741305; c=relaxed/simple;
	bh=N49wwcXacxGtutM/debQCHWIjOO2QPUr7k2djn61Vyc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hf1vjzXz7wHLCxPDzrlVFPAA/zpAFW4i7Abea2A44FsOK64LggviZwSM8XM0ieiNlAp6f2fzjN7pjQpv6aoYDchO/kyrZsabaDcsKScgddOLXfm2PPidL0balyYQ8AcegEOwdZKJaUNtjinJOBN02PJ77fz46vf/48GhzEn+xDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sjohal.net; spf=pass smtp.mailfrom=sjohal.net; dkim=pass (2048-bit key) header.d=sjohal.net header.i=@sjohal.net header.b=IGYvZ/j5; arc=none smtp.client-ip=45.157.188.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sjohal.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sjohal.net
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bZKJY0r2Lz6wD
	for <linux-input@vger.kernel.org>; Sat,  5 Jul 2025 20:48:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sjohal.net;
	s=20250422; t=1751741293;
	bh=DxGCQ3UNqCJ5i6hnkhcezR4P07jssjKb8GLtgfFeYQ0=;
	h=From:To:Subject:Date:From;
	b=IGYvZ/j5Yrwf0Tx5po8SbmMbZVt0XN0OsAfIhpuxVvV+HH6/44bORYMJn8eaAFKxI
	 Gh+BVD5sehYkX7Nwp800blXR6GLww0sAycAv2VO7z6mJSlzd//Q0icSIGKD8paG/5x
	 GoBCM50YrTjegE+bWl1Pglok/BxGQm+g90RgTNvKl2Ts9L8tZJ5jIUn7asi7tWI3fi
	 Hzr+kMr3MdQ43zG7YkU6iH3CdJpiKpFVXtYqdhE95tFC7YwZwPYbpHXQSVmnJr1tfj
	 OhIz1eiXN+eDdEoKjwhbQOhnHDJvNYfwo+RU2sayOZw5BeTvXvBS93RycmbLsS/MZ1
	 1mqJpOYWhEJPQ==
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4bZKJX4SfhzdNP
	for <linux-input@vger.kernel.org>; Sat,  5 Jul 2025 20:48:12 +0200 (CEST)
From: Saihaj Johal <personal@sjohal.net>
To: linux-input@vger.kernel.org
Subject: hid_nintendo Switch 2 Pro Controller support - where to start?
Date: Sat, 05 Jul 2025 19:48:12 +0100
Message-ID: <3642543.dWV9SEqChM@saihaj-mainpc>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-Infomaniak-Routing: alpha

Hello,
I recently got a Nintendo Switch 2 Pro Controller that is not currently 
directly supported by the kernel like how the Switch 1 controllers are. 
Looking in "hid-ids.h", there is no product ID for the new controller (got 
0x2069 from "lsusb -v"). The device class shows as miscellaneous device, and 
the controller does not show the player LEDs to show it is active (it only 
charges over USB, alongside showing in "lsusb" as well as showing as a USB 
audio device for the headphone jack on the bottom). However, I have managed to 
get it to work as a HID device using this website (https://
handheldlegend.github.io/procon2tool/) which uses WebUSB to send the right 
commands to make the controller turn on fully. After enabling, this setup 
seemingly works with the existing evdev system, although with some bizarre 
changes like the left stick's up and down being reversed (at least in KDE's 
game controller settings). The first step would likely be to add the device ID 
to "hid-ids.h", but from there where should I go in order to perhaps work on 
full support? I assume anything would work on the things discovered already by 
the WebUSB enabler tool, however I am very new to C and kernel development in 
general. 

Thanks,
Saihaj




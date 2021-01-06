Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76CA12EBBBC
	for <lists+linux-input@lfdr.de>; Wed,  6 Jan 2021 10:35:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbhAFJfZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Jan 2021 04:35:25 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:47901 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725803AbhAFJfY (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Jan 2021 04:35:24 -0500
X-Originating-IP: 82.255.60.242
Received: from [192.168.1.150] (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 27C5A4000A;
        Wed,  6 Jan 2021 09:34:41 +0000 (UTC)
Message-ID: <0de99cc89a3cc0cc5b3818e10aefdd2eaddd8032.camel@hadess.net>
Subject: Re: [PATCH] HID: logitech-hidpp: add support for Unified Battery
 (1004) feature
From:   Bastien Nocera <hadess@hadess.net>
To:     lains@archlinux.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Wed, 06 Jan 2021 10:34:41 +0100
In-Reply-To: <20210104182937.1472673-1-lains@archlinux.org>
References: <20210104182937.1472673-1-lains@archlinux.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 (3.38.2-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 2021-01-04 at 18:29 +0000, lains@archlinux.org wrote:
> From: Filipe Laíns <lains@archlinux.org>
> 
> This new feature present in new devices replaces the old Battery
> Level
> Status (0x1000) feature. It keeps essentially the same information
> for
> levels (reporting critical, low, good and full) but makes these
> levels
> optional, the device exports a capability setting which describes
> which
> levels it supports. In addition to this, there is an optional
> state_of_charge paramenter that exports the battery percentage.
> 
> This patch adds support for this new feature. There were some
> implementation choices, as described below and in the code.
> 
> If the device supports the state_of_charge parameter, we will just
> export the battery percentage and not the levels, which the device
> might
> still support.

I'm guessing that means no changes needed on the upower side?

Cheers


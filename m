Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B86345712A
	for <lists+linux-input@lfdr.de>; Fri, 19 Nov 2021 15:50:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230385AbhKSOxr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Nov 2021 09:53:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:43936 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230373AbhKSOxr (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Nov 2021 09:53:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E3805610A0;
        Fri, 19 Nov 2021 14:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637333445;
        bh=xQE9hxOzQKu53BN/XdielriygeauIcnIvehjrzh+cPc=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=MS+7I5Cp00XQcALDipjuJpNfFFlwNnRB7gwn2T3fDZ+yJr1YF/Z4eGMadSPhPo3JW
         6hf7XcT0gC2kctBj1CK07wgj6QP//aBBAg+JTloi/2x879ER8ZrmwN67nG7brMlN0U
         B2JIrD8R+wvRYlNqtrpeVe9Zw3sWCUz2aG0hpA2X5Kwrp+EWbV3h37dNK/l/sewCfE
         pgolL67nv44gd35F3Hdj20tOol0Ecu0GdWVQdP9Zz0oWNN9KG6Qzy+kbobX93z7ghk
         z9gDjic6pMiU1/kesAjp6u+mj9f2iCEfAlNOm3Xinm7GIplevGkYhQLgPaErKrdfiZ
         8DK/zMVXCN0cw==
Date:   Fri, 19 Nov 2021 15:50:41 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Matthias Kaehlcke <mka@chromium.org>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Hans de Goede <hdegoede@redhat.com>,
        Jim Broadus <jbroadus@gmail.com>,
        Johnny Chuang <johnny.chuang.emc@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] HID: i2c-hid: Report wakeup events
In-Reply-To: <20211102114017.1.I16ef7b761c8467be2106880e9b24ce304ae2b532@changeid>
Message-ID: <nycvar.YFH.7.76.2111191550330.16505@cbobk.fhfr.pm>
References: <20211102114017.1.I16ef7b761c8467be2106880e9b24ce304ae2b532@changeid>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 2 Nov 2021, Matthias Kaehlcke wrote:

> The i2c-hid driver generally supports wakeup, bit it currently
> doesn't report wakeup events to the PM subsystem. Change that.
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>

Goot catch. Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


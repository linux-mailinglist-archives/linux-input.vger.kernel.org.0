Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37796320804
	for <lists+linux-input@lfdr.de>; Sun, 21 Feb 2021 02:46:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbhBUBqF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 20 Feb 2021 20:46:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:43626 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229811AbhBUBqC (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 20 Feb 2021 20:46:02 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 957FB64D74;
        Sun, 21 Feb 2021 01:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613871921;
        bh=0Ktibfxk9m2S2eGJIy/dT31YT8eEfjMmb+aPyQq9vH8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=cjA6UI7tTpsQ7cTVLtaoGbt9UVa6Rs5h5f0GCD6EAHTS3qePmBVq3eAsJxqeQT7ji
         5qVLUHJzHw6nZv02ANHUevbs/jDn3gR4hgbaaO9B2yiqqPzVvXStJPH5ugZouuHILv
         69djcyGy4IvFu8tWGHq22yVrQYWLuBdSHG+NdFfBbRMrJ2/G97n0v0IG8AtiL28Smo
         6w12tKBAsRnNLvSz/fHRP5zXGtyk9t5mI0JbprMltFJF5oxuuezWhes7h6cXN/DXSv
         3p313U0O4GjwMqzoFvJIZSHGUa4xiT9eAlCxlH3rvfoD61+TyhFpR+BhQ4fmokaGsT
         iD1lR50RQGvsQ==
Date:   Sun, 21 Feb 2021 02:45:18 +0100
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        alsa-devel@alsa-project.org
Subject: Re: [PATCH 2/3] HID: elan: Set default_trigger-s for the mute LED
Message-ID: <20210221024518.7a29580c@kernel.org>
In-Reply-To: <20210220163211.323178-2-hdegoede@redhat.com>
References: <20210220163211.323178-1-hdegoede@redhat.com>
        <20210220163211.323178-2-hdegoede@redhat.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Again I would use
  ... Set default_triggers for ...

Reviewed-by: Marek Beh=C3=BAn <kabel@kernel.org>

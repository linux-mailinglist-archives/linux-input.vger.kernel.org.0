Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A66147D73D2
	for <lists+linux-input@lfdr.de>; Wed, 25 Oct 2023 21:03:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbjJYTDl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Oct 2023 15:03:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229851AbjJYTDl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Oct 2023 15:03:41 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9652F138
        for <linux-input@vger.kernel.org>; Wed, 25 Oct 2023 12:03:39 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ECDAC433C9;
        Wed, 25 Oct 2023 19:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698260619;
        bh=SmP0qQ3Eb2gamBLFB7BA4/3tje9F3Vlrksll7W0yHGY=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=mp3g62exlwbNpWSsGgCMjOPMD1VzF2mOpc4qIo5vT+53S5YEyqijppCp667SGhiQN
         o/lvo6G2n5x7mK02Cc6IDwqiuRHLzGckj7d4dSSFo6J9pFrEvujwWWpgqMJ8FrnqJ1
         pzIiWZSd5CkLoIP2rL+zMth7Z5rLgxXpRG6SZMI3u57gd/2Rrv1UK3/+lRN0F0wm00
         Xtj4tVxrf4cCSZ51ZjZTPa8bKKV1GToIItPw8FgT+pi7xyIKwPPiIXtqVcIn63OUam
         SrhnnjNKVLekhOXe3PJaoutkmQiHokHov2QZZ0gPFjMh23keyPXEzYM2j6m3s0Y5n9
         +X1UMDOQBjSmQ==
From:   Benjamin Tissoires <bentiss@kernel.org>
To:     =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     linux-input@vger.kernel.org
In-Reply-To: <20231010102029.111003-1-hdegoede@redhat.com>
References: <20231010102029.111003-1-hdegoede@redhat.com>
Subject: Re: [PATCH v3 00/12] HID: logitech-hidpp: Avoid
 hidpp_connect_event() running while probe() restarts IO
Message-Id: <169826061786.341792.12877858440681620901.b4-ty@kernel.org>
Date:   Wed, 25 Oct 2023 21:03:37 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 10 Oct 2023 12:20:17 +0200, Hans de Goede wrote:
> As dicussed here is v3 of my series to rework / cleanup the hidpp
> probing code.
> 
> Note the $subject of the cover-letter is not entirely accurate anymore,
> but I kept it the same since this is the successor of series with
> the same subject.
> 
> [...]

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git (for-6.7/logitech), thanks!

[01/12] HID: logitech-hidpp: Don't restart IO, instead defer hid_connect() only
        https://git.kernel.org/hid/hid/c/11ca0322a419
[02/12] HID: logitech-hidpp: Revert "Don't restart communication if not necessary"
        https://git.kernel.org/hid/hid/c/55bf70362ffc
[03/12] HID: logitech-hidpp: Move get_wireless_feature_index() check to hidpp_connect_event()
        https://git.kernel.org/hid/hid/c/ba9de3505095
[04/12] HID: logitech-hidpp: Remove wtp_get_config() call from probe()
        https://git.kernel.org/hid/hid/c/a3643036d7a8
[05/12] HID: logitech-hidpp: Move g920_get_config() to just before hidpp_ff_init()
        https://git.kernel.org/hid/hid/c/219ccfb60003
[06/12] HID: logitech-hidpp: Move hidpp_overwrite_name() to before connect check
        https://git.kernel.org/hid/hid/c/8954dac18c68
[07/12] HID: logitech-hidpp: Add hidpp_non_unifying_init() helper
        https://git.kernel.org/hid/hid/c/c14f1485c605
[08/12] HID: logitech-hidpp: Remove connected check for non-unifying devices
        https://git.kernel.org/hid/hid/c/6f335b47adc3
[09/12] HID: logitech-hidpp: Remove unused connected param from *_connect()
        https://git.kernel.org/hid/hid/c/bb17b2c6dd87
[10/12] HID: logitech-hidpp: Fix connect event race
        https://git.kernel.org/hid/hid/c/680ee411a98e
[11/12] HID: logitech-hidpp: Drop delayed_work_cb()
        https://git.kernel.org/hid/hid/c/f3c4ee7166f2
[12/12] HID: logitech-hidpp: Drop HIDPP_QUIRK_UNIFYING
        https://git.kernel.org/hid/hid/c/9ce363aa009c

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2687C7D803B
	for <lists+linux-input@lfdr.de>; Thu, 26 Oct 2023 12:05:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234816AbjJZKFE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 26 Oct 2023 06:05:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233221AbjJZKFC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 26 Oct 2023 06:05:02 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 974FA1AE
        for <linux-input@vger.kernel.org>; Thu, 26 Oct 2023 03:05:00 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3A8DC433C7;
        Thu, 26 Oct 2023 10:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698314700;
        bh=NsR97li+a4kyeeEnqq7UvEvaGMZgPRKTfdaHLBeSRro=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=Z/Pj1/Xv5MyECyjJVmy0NPaLReJ49Dd5H9Moxb1ZsByCOPwL/aYjtzzxn1nI8OrBG
         h7n5HwyFRjyImI51sNcASL3oQI5vr1TvC0ZUAUkmCivfTpoi8mkcZhjZNsUu8Qm2F3
         JAw0NdL2CT7SiQbUQMs0/FnUwCjZ6FRM23Jq0xzAeTFbzpklKb3GXCyg+1WPMngu5k
         x95uGA6BBVP3JBwKOMeOMdYKpvJ93m7t+Fcs88IAuz/V6Jcu9erA91yqNLXWlCJ0SW
         SH3VpQz51Xrhi9HT42GhT8RVx0jb3XY/EZDJA92TaE3qAZQl2IkDsnFXdjJwaSN2j8
         kl5BiV0yMBeKA==
From:   Benjamin Tissoires <bentiss@kernel.org>
To:     =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     linux-input@vger.kernel.org
In-Reply-To: <20231025190151.302376-1-hdegoede@redhat.com>
References: <20231025190151.302376-1-hdegoede@redhat.com>
Subject: Re: [PATCH] HID: logitech-hidpp: Stop IO before calling
 hid_connect()
Message-Id: <169831469865.58750.10364401995553425042.b4-ty@kernel.org>
Date:   Thu, 26 Oct 2023 12:04:58 +0200
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

On Wed, 25 Oct 2023 21:01:51 +0200, Hans de Goede wrote:
> hid_connect() will call hid_pidff_init() which does
> hid_device_io_start() leading to an "io already started" warning.
> 
> To fix this call hid_device_io_stop() before calling hid_connect(),
> stopping IO means that connect events may be lost while hid_connect()
> runs, re-enable IO and move the hidpp_connect_event() work queuing
> after the hid_connect().
> 
> [...]

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git (for-6.7/logitech), thanks!

[1/1] HID: logitech-hidpp: Stop IO before calling hid_connect()
      https://git.kernel.org/hid/hid/c/3e6b0bb22a80

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


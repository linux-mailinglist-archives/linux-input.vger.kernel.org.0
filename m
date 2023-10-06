Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8AFA7BB9FE
	for <lists+linux-input@lfdr.de>; Fri,  6 Oct 2023 16:12:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232248AbjJFOMM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Oct 2023 10:12:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232503AbjJFOML (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Oct 2023 10:12:11 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 706729E;
        Fri,  6 Oct 2023 07:12:09 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5605C433CB;
        Fri,  6 Oct 2023 14:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696601529;
        bh=PEJSGqUvssmM13ESjCNwtPIKW4jeWq6BELPGXygd/KE=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=MRWXJ0jEtRpRqq3ho51/bSvI73M9nVi/6IhvjQDLBGSqduvVk9cacypgxdnUmJFge
         aAOPUcJGFdilbmkSpU3wKs0P55FooMzDB/HDSAq0FOQwjrV1n0fTuHH/UeZQ3k3CO5
         4GEXSqX7pkpLXPgHUdjVOly3NwMy/WTFsky51V9t4AJaRoTeutqG1lOc23j/3oV4We
         2v3GpuGiY5lYPQl1TVQdrnbccJs7Uj5UAODS8IVFwL2OpN9PcVYuNHJVOmCo10qc15
         DCIFtA+fpgW/YLPh2eLL3KznCX6xFWAsoU4jYM0Bdb4ZrMZNuA3weOt+9ZCysxk50Y
         1H5bLzGO8KISg==
From:   Benjamin Tissoires <bentiss@kernel.org>
To:     =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     linux-input@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20231005182638.3776-1-hdegoede@redhat.com>
References: <20231005182638.3776-1-hdegoede@redhat.com>
Subject: Re: [PATCH] HID: logitech-hidpp: Fix kernel crash on receiver USB
 disconnect
Message-Id: <169660152754.2015335.1504667640819590220.b4-ty@kernel.org>
Date:   Fri, 06 Oct 2023 16:12:07 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 05 Oct 2023 20:26:38 +0200, Hans de Goede wrote:
> hidpp_connect_event() has *four* time-of-check vs time-of-use (TOCTOU)
> races when it races with itself.
> 
> hidpp_connect_event() primarily runs from a workqueue but it also runs
> on probe() and if a "device-connected" packet is received by the hw
> when the thread running hidpp_connect_event() from probe() is waiting on
> the hw, then a second thread running hidpp_connect_event() will be
> started from the workqueue.
> 
> [...]

Applied to hid/hid.git (for-6.6/upstream-fixes), thanks!

[1/1] HID: logitech-hidpp: Fix kernel crash on receiver USB disconnect
      https://git.kernel.org/hid/hid/c/dac501397b9d

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C20247D6F5A
	for <lists+linux-input@lfdr.de>; Wed, 25 Oct 2023 16:43:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235099AbjJYOR0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Oct 2023 10:17:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344879AbjJYORR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Oct 2023 10:17:17 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE54718D
        for <linux-input@vger.kernel.org>; Wed, 25 Oct 2023 07:17:10 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 181E5C433C7;
        Wed, 25 Oct 2023 14:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698243430;
        bh=OLj5uI4hRFVETXSlgqWaicXOwsQrARdHcWHpzyD5wL4=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=QUyPCfMtBXUaIVx8iPv6vXm71Zdhci9fXwPA0kZFGFpPCQGtD0UFJqc3Vz3BGzQyi
         OLIWJ1h2vW13HZ//rzngigG5CZwePvi+n1P+3lllBjjBc90kVFjQ5pw6J88GWQPN+K
         Lm7L0OQys46Ryz2Fo7CsRpAy+L4CIcnhPee78DWw17UGJir8pjsyrJZx73UuKJj4Fo
         nGhixNi4nPSfoBn8GV5xK885ukGkfTgV7maMYZ3tuHKXRPRKgCa47bADNcLZuWfL1b
         o6NSU2WeH5VcKnoygwQMq48l8FlJWZNRXMFs5YCXvfFhuDAhL58nj1lJFMMbg8rN5l
         ft1O4P2ATYZnA==
From:   Benjamin Tissoires <bentiss@kernel.org>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        andriy.shevchenko@linux.intel.com,
        Danny Kaehn <danny.kaehn@plexus.com>
Cc:     linux-input@vger.kernel.org, ethan.twardy@plexus.com
In-Reply-To: <20231011182317.1053344-1-danny.kaehn@plexus.com>
References: <20231011182317.1053344-1-danny.kaehn@plexus.com>
Subject: Re: [PATCH v2] hid: cp2112: Fix IRQ shutdown stopping polling for
 all IRQs on chip
Message-Id: <169824342881.92398.16480136950125316282.b4-ty@kernel.org>
Date:   Wed, 25 Oct 2023 16:17:08 +0200
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

On Wed, 11 Oct 2023 13:23:17 -0500, Danny Kaehn wrote:
> Previously cp2112_gpio_irq_shutdown() always cancelled the
> gpio_poll_worker, even if other IRQs were still active, and did not set
> the gpio_poll flag to false. This resulted in any call to _shutdown()
> resulting in interrupts no longer functioning on the chip until a
> _remove() occurred (a.e. the cp2112 is unplugged or system rebooted).
> 
> Only cancel polling if all IRQs are disabled/masked, and correctly set
> the gpio_poll flag, allowing polling to restart when an interrupt is
> next enabled.
> 
> [...]

Applied to hid/hid.git (for-6.7/cp2112), thanks!

[1/1] hid: cp2112: Fix IRQ shutdown stopping polling for all IRQs on chip
      https://git.kernel.org/hid/hid/c/dc3115e6c5d9

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


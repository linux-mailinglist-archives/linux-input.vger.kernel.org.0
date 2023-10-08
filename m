Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F1187BCFC5
	for <lists+linux-input@lfdr.de>; Sun,  8 Oct 2023 21:11:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344422AbjJHTLA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 8 Oct 2023 15:11:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344413AbjJHTK7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 8 Oct 2023 15:10:59 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC793AC;
        Sun,  8 Oct 2023 12:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
        t=1696792257; bh=HTTJDJafn8qJ5y8ypB1X2wmPBXY2xmjffTqJQzQtOmM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h2gP711hueezP+66rwMJLWYR4gkQ+T+bNaaoU1UBRrB5ACZvmSlGFC64Y1V/FNuNy
         vg5SHL6shRKFt4Am7e6nAtNyg5GSrGzRuz3erfCVkufo+nUhSbZxsMrfUAE+EtDsL/
         DbXCjvYZXzhT80IzWgGBfSVtjFYDC/KDoBZvldhY=
Date:   Sun, 8 Oct 2023 21:10:56 +0200
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To:     Anshul Dalal <anshulusr@gmail.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v2 2/2] input: joystick: driver for Adafruit Seesaw
 Gamepad
Message-ID: <54334f96-a1cc-439b-9de2-ec0187495f35@t-8ch.de>
References: <20231008172435.2391009-1-anshulusr@gmail.com>
 <20231008172435.2391009-2-anshulusr@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231008172435.2391009-2-anshulusr@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 2023-10-08 22:54:34+0530, Anshul Dalal wrote:
> [..]
> +
> +	input_report_abs(input, ABS_X, data.x);
> +	input_report_abs(input, ABS_Y, data.y);
> +	input_report_key(input, BTN_A, data.button_a);
> +	input_report_key(input, BTN_B, data.button_b);
> +	input_report_key(input, BTN_X, data.button_x);
> +	input_report_key(input, BTN_Y, data.button_y);

FYI the button layout on this device is different from common commercial
gamepads like XBox, Playstation and Logitech.
This seems to be common to all gamepads from Adafruit.

Adafruit:

    X
 Y     A
    B

Others:

    Y
 X     B
    A


In input-event-codes.h the symbol BTN_A actually maps to BTN_SOUTH,
matching the common layout. But as you can see this is wrong for this
device.
(Same for BTN_B and BTN_EAST)

Weirdly enough for BTN_X/BTN_NORTH and BTN_Y/BNT_WEST the aliasing is
correct for Adafruit and wrong for the others.

Not sure how to fix this correctly. Maybe the input maintainers know.

> +	input_report_key(input, BTN_START, data.button_start);
> +	input_report_key(input, BTN_SELECT, data.button_select);
> +	input_sync(input);
> +}

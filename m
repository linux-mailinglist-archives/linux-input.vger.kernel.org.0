Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58DD77CC557
	for <lists+linux-input@lfdr.de>; Tue, 17 Oct 2023 15:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235060AbjJQN6t (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Oct 2023 09:58:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344062AbjJQN6b (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Oct 2023 09:58:31 -0400
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBF3B11A
        for <linux-input@vger.kernel.org>; Tue, 17 Oct 2023 06:58:24 -0700 (PDT)
X-QQ-mid: bizesmtp77t1697551013t4vpc3bk
Received: from localhost.localdomain ( [58.249.112.42])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Tue, 17 Oct 2023 21:56:30 +0800 (CST)
X-QQ-SSF: 01400000000000B0F000000A0000000
X-QQ-FEAT: QZiP3VLl9WaPuzxrj5CT6ixcIGbRGXPU/tExE2eSnniQzZM6dWyeAaK30R/l1
        FAQpwOyT9g3y3orLipDQsz8E3SkJSMI5ssdAGfhdAFYyg+Ca0pwAEGz0pyN5nRj2zTSCOdF
        WC0EuAGpqgtd9wJDUBZPh0kiCPKJy+Hw25JIAD/PWj8+3Axq/gqUwJ0nvImu0kjGLLIhEN2
        T19rykUiMHnq/yxteExb2YWcTKMD0AbRFAcw/D8iZkWhYtv9VU/2pfdxphmMKf+LUlZVc8G
        mU8oqFcPL9RcM1R1sa/46qoR8+Iux6ISINN9P95xddgxJbZsKKnduHwCoAbfpnc+WP2U3Lf
        FkzM1vWYZA9zps2tUqA/Vk35MDp1EeNx2DGeCJm++3DP7vYm3bMQacsSrkeZQ==
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 850482525066011867
From:   Shang Ye <yesh25@mail2.sysu.edu.cn>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Shang Ye <yesh25@mail2.sysu.edu.cn>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 0/3] Input: atkbd - add skip_commands module parameter
Date:   Tue, 17 Oct 2023 21:53:17 +0800
Message-ID: <886D6167733841AE+20231017135318.11142-1-yesh25@mail2.sysu.edu.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231005201544.26983-1-hdegoede@redhat.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:mail2.sysu.edu.cn:qybglogicsvrsz:qybglogicsvrsz3a-1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,T_SPF_TEMPERROR
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hans,

I very much support the inclusion of this patch, because there has been
a similar keyboard issue on at least 3 (presumably 9) types of Lenovo
laptops, which may also be avoided by simply skipping the GETID command.
My patch and a list of the affected laptop types may be found at:
https://github.com/yescallop/atkbd-nogetid

In my last patch submission, I have included the issue details:
https://lore.kernel.org/linux-input/20230530131340.39961-1-yesh25@mail2.sysu.edu.cn/

There were also two other patch submissions aimed at enabling
`i8042.dumbkbd` on some HP laptops in order to avoid sending the GETID
command, which isn't very desirable because it breaks the Caps Lock LED:
https://lore.kernel.org/linux-input/2iAJTwqZV6lQs26cTb38RNYqxvsink6SRmrZ5h0cBUSuf9NT0tZTsf9fEAbbto2maavHJEOP8GA1evlKa6xjKOsaskDhtJWxjcnrgPigzVo=@gurevit.ch/
https://lore.kernel.org/linux-input/20210609073333.8425-1-egori@altlinux.org/

And another patch submisson aimed at fixing the issue generically,
which, sadly, did not work on my laptop because the GETID command would
trigger more errornous behaviours on it:
https://lore.kernel.org/linux-input/20210201160336.16008-1-anton@cpp.in/

I hope that these materials will help people better understand the
nature of the issue and the urgency to address it.

Below are some comments on the patch:

> +MODULE_PARM_DESC(skip_commands, "Bitfield where each bits skips a specific keyboard cmd (0 - 0x3f)");

"bits" -> "bit"?

I think we may also need to document the new module parameter at
Documentation/admin-guide/kernel-parameters.txt and clarify which bit
skips which keyboard command.

Lastly, would you think it is appropriate to include in this patch
series the quirks for Lenovo laptops on which my patch was tested to
work? If so, the quirk table entries would be:

System vendor: "LENOVO"
Product names: "82G2", "82NC", "82TK"
Driver data  : ATKBD_SKIP_GETID

Above all, thank you for working out this nice patch.

Regards,

Shang

On 2023/10/06 04:15, Hans de Goede wrote:
> Hi all,
> 
> While debugging a keyboard issue on some HP laptops adding i8042.dumbkbd
> helped to avoid the issue. So one of the commands send by atkbd.c seemed
> to be the culprit.
> 
> This series a skip_commands option to help debug cases like this by adding
> a bit-field which allows disabling a subset of the ps2_command()
> calls the atkbd driver makes.
> 
> It also replaces the existing atkbd_skip_deactivate flag
> with the new parameter and adds a DMI quirk for the HP laptops
> to avoid the keyboard issue there.
> 
> Regards,
> 
> Hans
> 
> 
> Hans de Goede (3):
>   Input: atkbd - add skip_commands module parameter
>   Input: atkbd - drop atkbd_skip_deactivate flag
>   Input: atkbd - set skip_commands = ATKBD_SKIP_GETID for HP laptop
>     15s-fq* laptops
> 
>  drivers/input/keyboard/atkbd.c | 88 ++++++++++++++++++++++++++--------
>  1 file changed, 69 insertions(+), 19 deletions(-)
> 
> -- 
> 2.41.0
>

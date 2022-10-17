Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 374AF600DAC
	for <lists+linux-input@lfdr.de>; Mon, 17 Oct 2022 13:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbiJQLZl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Oct 2022 07:25:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229959AbiJQLZl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Oct 2022 07:25:41 -0400
Received: from mout-xforward.gmx.net (mout-xforward.gmx.net [82.165.159.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D406B4F1B3
        for <linux-input@vger.kernel.org>; Mon, 17 Oct 2022 04:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1666005932;
        bh=dXMo1ax/rnFd8oX5HZHatQdAtdWXKoYj5mIYVzQglpw=;
        h=X-UI-Sender-Class:Date:From:Subject:To;
        b=EUb08XPcWCrTqgeHcdvayEIE77FrtObtCANi/I0UNyi1ZReXDXTC0BB6zukzE6uif
         NqXehcvr/5XKSGKN4lO4Q7q8bUcHASlgOdNRsX4kQ3DBC0ZxRfqdFxgEiHKLspQl7w
         xvQxTO7ZmWw7pq64eQN2tmdUDea70NSNtlsoR3ZI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.13.110.18] ([143.244.37.142]) by mail.gmx.net (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1Mq2j2-1pXQ6w1wmo-00nDU9 for
 <linux-input@vger.kernel.org>; Mon, 17 Oct 2022 13:25:32 +0200
Message-ID: <49ca0fec-934c-b86f-3d63-25d9b8059708@gmx.com>
Date:   Mon, 17 Oct 2022 11:25:31 +0000
MIME-Version: 1.0
From:   "Artem S. Tashkinov" <aros@gmx.com>
Subject: Keyboard LEDs must be reset on resume (retry)
To:     linux-input@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+9jHb8MO9c7j776ezlHl7HEx7UU8335aFTUImEA3CpdAY4XlNp5
 /RRVP5ONB/ldHtqDZY5Wxy44TSwg7CoP0wvXDavtRPp/N2T63+yAAfdP/8JXid7kpciXXjz
 iYQmKthuKcvgJBpP8/rPrSm5kVa24ONkd5UzMYeTEdqRPKZqwprhfxYdVL3fWKfN6ZT7Z+/
 HCea6lvmyfVBFF0OX/gnA==
X-UI-Out-Filterresults: junk:10;V03:K0:qwiiRfRx1Bg=:ZBgEzY7vEfVtqoLkQiWOMuCc
 pjP29SEXhWqPyne8w/S0ioPjkiPdQ4LvjjuxB3zrCW/u+D9YFLzJu9BYg/XNDUGm9sNeAppnU
 CP2QqGrfMdJV8ODplmxCYhr18n2752WUpBzOnUcGOlHWVzUx08/Wk007jLoACmwrT6iSmnNld
 ID6n1ePfFz6XrMlFDPbUN63YtqlhIst+2H2HM6q8vNEGqORxugViXKPNDAv4E3GiwQFmIQ6Bk
 tv/J9zWb0JcVFkZpkqd1TbyWyUD6GEv8PzF3ZfgDsDv574soURf/ep/3tLyRw9Ucwb48CAevp
 OT3iPp6YJz49qb+jl2f9jLzdx/O39pol1Gzr2ckKhIZqhdWIUjUyoA7NDvdDpXRruzm1cqnr4
 Om2V003wfLp3jB0Q8ZX05+SS5tzvd21KWcvMSMjNZuxfenMC1YvAHkzBSehrVLIHR7aadeb9N
 kapFQsb9oGkzvI39f4sx9cDyPFnDhH0r7ZRf7xL3iIeFLgue2Int96cLFpAV34snDfYRZdx8y
 dezBq17FMJ5Vp60cGC/EWDMa7L/8k1McpE4nDurLP9X5fG2lzXkqfzesAQ4XZXFoQU8My4dHC
 7YERw0JLjyuVMvq0yxodKsMvJ+2KnNsgdY2PevUTQu3qPNoA9+BMxNqJGXqLeD5N621MQExo2
 l9tlNfuyNGTl58/CNDr6jZG6n5YW6XGjx/GEXnDYeOz68Dc49xcoRzsRBbTvQGPa3mlAXQWsM
 Pvisy1kOwib4fOPIX8RN8fMnwn/GFx27M+PzZf/YRsM/q4e6vez86XfOqAXIAf+J2TbufSlZL
 9GFkZnxmwu2+fdM0tjGOJ/XTKYBXMPvscAvM58o20QaBaY80Fi/vZrDt89wxB9PgBrrNoxLL4
 aRXFg90P4c9xV+wROdar+CJ82wXBgNPEDfv2k0qOrctNNwha7JxGeqg91GscLqCp+4rRlZVJa
 yl/9aWFyQE4Zinf1pt6AFzKWxlRZq4/fO+OWG81hbVlewPfYpSiRiwixzInFZlPtrexkOvXAW
 c9jtIZ36akcdD8EuLRJd/FliA4curcFfIuU2tse7HtyAj/Na5flzPcKv+tKClThBWrYsqRB4N
 QVOm4HdA7tQmgfKLlALmo+7DP7E1k56QoUC1UYBwjIY3zmjYi7CnhWEtYdcwfj5oZlLwkvRSL
 y+2EskU0dZlPtJ23lyi2PvsMuxxPQuuQE0+tQqr5LJZE1rzRIxNhaN0D4ZOKSRgWASGYQqmhB
 UfP0JsZOk2NvCcKkP8C448/pad7SxSqI6Hj+NuiCPas7ndlydN8FRVAwqA3lLbMlwdlMIwXBa
 MCd0upseWvJ29pMPHb+ecaG1mbC2gVJxR3HyLJ9GCaKcUqGRNyL4tSRPZhpawdTUTIboIcIsx
 /sr8OHLkCN4fILRhiX/pnsLM99mbeIlZsifTfx5D3jnb8N1JElmXoRkmlQZETLKZQJuk0xjwq
 ekSR2cCdUKRihj+PpCYgMoc0OGgr+n3P3THcmE/I+NuS2wao+HWwGxx/sIKe2KiNsfjc+7SON
 YdP9oYzBTJ/jv34gp/AbDZGf++BYGPpYGJHiLbIly7ip6tl+dAcJEEBhJgPi1sAxw==
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,RCVD_IN_SBL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

I have a USB keyboard: ID 046d:c31d Logitech, Inc. Media Keyboard K200

After a suspend/resume cycle all its LEDs are off even though some of
them must be on, e.g. the NUM lock.

Please reset LEDs on resume for USB keyboards, at least this one.

Probably it's worth doing that for all keyboards unconditionally.

The respective bug report:
https://bugzilla.kernel.org/show_bug.cgi?id=3D216274

Best regards,
Artem

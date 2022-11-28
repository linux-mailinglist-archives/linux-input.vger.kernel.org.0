Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EC3963A18D
	for <lists+linux-input@lfdr.de>; Mon, 28 Nov 2022 07:48:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229895AbiK1Gst (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Nov 2022 01:48:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbiK1Gss (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Nov 2022 01:48:48 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1795E645C
        for <linux-input@vger.kernel.org>; Sun, 27 Nov 2022 22:48:46 -0800 (PST)
Received: from Valinor ([82.203.167.38]) by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1M7K3Y-1p51a138TE-007o58; Mon, 28
 Nov 2022 07:48:25 +0100
Date:   Mon, 28 Nov 2022 08:49:57 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH 7/9] Input: n64joy - Fix DMA buffer alignment.
Message-Id: <20221128084957.4068d0716b3eeb62d7a3f228@gmx.com>
In-Reply-To: <20221127180126.349290c3@jic23-huawei>
References: <20221127144116.1418083-1-jic23@kernel.org>
        <20221127144116.1418083-8-jic23@kernel.org>
        <20221127184844.f967054e30c47a3caa5090eb@gmx.com>
        <20221127180126.349290c3@jic23-huawei>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:mqPt514Bbyk4HZUar/hVdYse6ok6VO/ENmVoOwD5QdF2SkLi17d
 KCJTLlmEHEFsWPg4TMcIUex//own8mGo8x2h7QVnT/QsglAbrJOfldfaaUeu0Hxaxal2XPv
 tRCvGXlOZxhUvkLxeYeX6nIR/wmQUxhdmHyWSPz1HocNO2KhwYeWvgNbWwnUJw/NqC0kck3
 I0Ceo0KQOFHh4G7ECmkqA==
UI-OutboundReport: notjunk:1;M01:P0:ZLJpR47ZXu0=;pQmv10Sjlk4/N3x4nKOPRLERUl+
 5nPmyRzEVC7T9IHfOcWiwt3sK3ie3hgqaQgzw2geOrdFaCP+T5xUpvDL3J4Kmw6YC0IGzYlJt
 dbdXVi9vzsfWjl1lolvNsKowwDS8AhsrotbEnVNA6JfauFRhQp66NB/f+++1iOBrcgSjdOVm0
 pcUyGBFrpWlSTqT7O46YjcOvHA52/AFDSKP4CmI/6eOMw0d/ojrdl+b0ZFk4T8m0Ne80xpAF3
 qL8oxWo5MR4lO7bwuhzOg0HxtVVTBQIuPy2Wq8bO/q0e1qGmc1czJM6QIWX+WlamJ8+lcR4iw
 Shud37jTbf9DQd6Ob0JHsqZ2J2Nn4Df0J13DQCeJUtXj0v6Z+Hu0MjO9CilEjOmInu/8KJGBl
 AAGeMtthsD9NFUzahA7ql9Vai40gUQGbjkkCpORyYFb02LTFKrhbRLN+VEj/LH1gFwOEGEFtV
 PzGER7a2bDBRtCdk/qVgZzK2VbbfNyRIYDNwVizFuV1Fm/OhaE+5x7Kd0U2iAS0ZJzTkLPpdL
 snB6lebxrw/w3kaglHFXlHzvc/XDOT57tc94jNNfxUmmygJlYjqMpQfT8h8y7rdVjsrlnRvLk
 7Wr0Np5XJc1Eap0dwfp+1T5L4uPP+F1W1uBXlxOyq8r1spJ2ggzLiNiOOkhTwnPFC7pOHcHlw
 c6do/QqFOmjmP74jvg00u5qyFWDsUqIUkh5DOEOfS8gf4HfDqt24EXtscsWCjYajf6nbP45NE
 AXXQtrRlEjwbZOxAUGOWB9hQEuyIRgjhBfZQ/6cHwXtcPwV5V1jckbylQwhCdwExvirlOdJL7
 AOy+v5XMg/XXTLAcB8x9hDBGbmeTZiT1Jb+aKTygDzCQJ+NM0fGa7Aw17/6TC+1zQu1LN/q5U
 UrYBM+O++8KWM578XzR/twUDvjU/MuX8dnSxfk1or+5Ql9RY58NpMzbyybaBHzaGou+oV/3xk
 4YjJvvVXGTcU7QlnhWOTpPO5ba4=
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
        NICE_REPLY_A,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 27 Nov 2022 18:01:26 +0000
Jonathan Cameron <jic23@kernel.org> wrote:

> > This move is unnecessary, because the cacheline is 16 bytes and the
> > buffer is 64 bytes.
> 
> Ah.  That particular option hadn't occurred to me (and I'd failed to notice
> how big the buffer is :( ).
> The marking isn't needed at all then as the allocation is already
> guaranteed to be sufficiently aligned. However, maybe that is a bit subtle
> and having some sort of marking is useful.

You can replace the __cacheline annotation with a comment, that's
totally fine.

> Curious question though, why is the buffer so big?
> Each struct joydata is 8 bytes I think, but the driver only accesses 4 of them.
> 
> Is the hardware putting garbage into the remaining 2 cachelines or is there
> something subtle going on?

That chip operates on 64-byte units. I don't remember whether the
remaining area is garbage or the input bytes or something else.

- Lauri

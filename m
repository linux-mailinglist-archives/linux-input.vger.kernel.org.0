Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65F8E639BD4
	for <lists+linux-input@lfdr.de>; Sun, 27 Nov 2022 17:47:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbiK0Qrd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Nov 2022 11:47:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbiK0Qrb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Nov 2022 11:47:31 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E649221
        for <linux-input@vger.kernel.org>; Sun, 27 Nov 2022 08:47:28 -0800 (PST)
Received: from Valinor ([82.203.167.38]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1N6KUd-1owolQ1cQT-016gli; Sun, 27
 Nov 2022 17:47:09 +0100
Date:   Sun, 27 Nov 2022 18:48:44 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH 7/9] Input: n64joy - Fix DMA buffer alignment.
Message-Id: <20221127184844.f967054e30c47a3caa5090eb@gmx.com>
In-Reply-To: <20221127144116.1418083-8-jic23@kernel.org>
References: <20221127144116.1418083-1-jic23@kernel.org>
        <20221127144116.1418083-8-jic23@kernel.org>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:kfTENLsOQp3w5fVBTZPrWMPqAkoYMQixG2xeQZGkDZ58WeS7Mce
 TeOo38LKL7rf4eEhrHiV8PDEiWLKdL0TGKGKfDnmXDl6hO1jUzgUoab/OTAL+dNvJUMjZ6T
 CI8+TdjOgoxoB1cTMmmOvuveHOEP5mK6vqR5z8XgMmYAzxcQW8hENZUVh8CQ7r9/0sliKZd
 u1w4IFb2Jhs7APUbXKNlA==
UI-OutboundReport: notjunk:1;M01:P0:98BORJRjTE8=;KeK0OHQgTKDgDrUl4g3dn4dDkiz
 fB65RK3kQcktfmJaoEsXiE9dtF9LZ7IuTFuXCp0983cyoJ7yLIUci8PwMvUCvaimy2f+lgWcx
 F/Xai1ahe8JLfXlkKMcW6aAWubrG6r5x9Syc4Eh9hc19scSczfdZtbOLKLGgasprW8kk5TFz/
 E5Qwh7e9et+gxy2NiNYNw8htVnB9/JHCoFPQEuzs1ySASscgNVTfI3rLaYEnyYoK6hY+7uij8
 o2RmV7sowyPjLKL8Xhw1fJ+UbrC+xm/Tzb7J3Y8keTV068WyJ/ZVkNKQHM7P8FLzVK1R7VmWd
 aRb5ejKBbucje971vY7AR1pUV2IuToUWLKXnQ5fj4NLIy+NRdJ/FkBApea1Ghyc3ABoCeLYgR
 UYoQdUvlshM+maibun+s9WTTSyhmzGuqwLd/TxdOHkZFl4QEAdgOFYA+1dlWfFhUtLJec9m24
 X+cPOCmEC8NS1Oe2oxt9eBmvPfcHVH2qxXKYnhrun4UZn94Ea5EJ0EO7jIBqlMmzl0bO9UtkZ
 K4IZSyLBkW5xfiz7tlvoy+/iDeXiqy5Ai5/XXVmY+bApplSaR+U4U4nkbg8X9jd0hV5sb1gqa
 p8xmt1YIIZYRPOAm8DKINeIyzvuSP3thUjHl3sSblqEvek9cS+p7gBBPPLYL0ibZE54mMST0s
 hK8g4atWp8t4UNBgxSPm3QRVyXRV0zfnDpdJLZ6uiDuR+ObKE7KelFg5UUsjLRRmp0lVISeKu
 mWd5Iuwf2PDsM6J59jRUSA8smmfcA3AxYVR1Ije/uuPTpFgpeAWFSBOQmIunXpUDgFhQMrraL
 4bpr7low4PwwUJeNb65BOn3i/vxqKrtyM9Wkf++ArM9iedlU2PSNMvghCUyVN7Tbpyyhv7uTK
 IsxqGuI3HCDEWpKxcSpWzyFVJz+nue0TqdTVAbngYlDoN10p33z8sPUkRykkUw8IPUzuzDw1W
 xL56RWDgbSbX3MpWJa9onMSHXKI=
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
        NICE_REPLY_A,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 27 Nov 2022 14:41:14 +0000
Jonathan Cameron <jic23@kernel.org> wrote:

> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> The use of ____cacheline_aligned to ensure a buffer is DMA safe only
> enforces the start of the buffer alignment. In this case, sufficient
> alignment is already ensured by the use of kzalloc().
> ____cacheline_aligned does not ensure that no other members of the
> structure are placed in the same cacheline after the end of the
> buffer marked.  Thus to ensure a DMA safe buffer it must be at the end
> of the structure.

This move is unnecessary, because the cacheline is 16 bytes and the
buffer is 64 bytes.

> Whilst here switch from ____cacheline_aligned to
> __aligned(ARCH_KMALLOC_MINALIGN) as on some architectures, with variable
> sized cacheline lines across their cache hierarchy, require this
> greater alignment guarantee for DMA safety.  Make this change throughout
> the driver as it reduces need for a reader to know about the particular
> architecture.

This change looks ok.

- Lauri

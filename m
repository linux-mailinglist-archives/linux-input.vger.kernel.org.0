Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2EB044FB8A
	for <lists+linux-input@lfdr.de>; Sun, 14 Nov 2021 21:19:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236208AbhKNUWR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 14 Nov 2021 15:22:17 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:56191 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235996AbhKNUWF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 14 Nov 2021 15:22:05 -0500
Received: from [192.168.0.107] ([92.117.251.175]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MvJs9-1mUY221NxZ-00rDrN; Sun, 14 Nov 2021 21:19:03 +0100
Message-ID: <45a9979b-39a1-7d76-2c0f-8270481c1d74@cpellegrino.de>
Date:   Sun, 14 Nov 2021 21:19:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] HID: magicmouse: prevent division by 0 on scroll
Content-Language: en-US
To:     =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211114025327.146897-1-linux@cpellegrino.de>
 <20211114153354.GA7246@elementary>
From:   Claudia Pellegrino <linux@cpellegrino.de>
In-Reply-To: <20211114153354.GA7246@elementary>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ACLputIHXJMA3r3UcWsiY+36cUGjlClAiALyoyno1byBR2GpKQA
 RhvaBZfFL9g2IrfZ40vG+CJQE0Jqsc+4Qx+ao5ZLAIGzo4DMjV7PMvheIY/3FZgXjmsPGZb
 Zxe4WjcDVM/OT4DuQ3TYoQk05+5VPFJK+LefE00V0hdYX5VseByWipLc2kjLmQaOjMaoX6r
 FtXxBy3PfNkyx49dSHEsg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:h1hWCZGxFGg=:ViBfk5Jxx8DVklakf/OWH+
 gl3YfbHSP7xtGpdJpKEqXTBiM3Fd7XgpYIMqyaDOcPBNfE7xtyzk+KUKwEWYFP5k/MdtoI3yV
 bhqbbaT3QvXL1xM2OV/6YCFZvL/RNrPrOrM8MkaZGSyhERHv/1sBdjTDteU5wGxseK0QccB1w
 B84+TyrDpaBHTE9PWvpDPiK0Isn3lB185U2NstjHsOJ/ONedPKU74suse7AJKeSZ9se40pOkI
 JQnRPPWxYk5UjOhgJbxjJKQszr8oW8fxuNIdhyPFDREys7D/GZcpS+3twBE0M3yu/bNyFLs3q
 0uPVDMAXb4CkJOr8oXOQ/rhMBcGisjm0t789wvNKDmXoRZs39hVVtu1LHw9tsT1vCH7iMVvhu
 fvW8tks2DBCUqGhBSygxx+RBo2WRPeVYGrqSf9L96d9d8zW1T98v0zuPhy4rd/OIZVSgqUxAc
 dqmCRkjgr9fsaDl/pWTN0BFTDXJ7iIgAJAOWW7ALMm0MSrPmTemgQuykN5wHpQqXesZdoJUaO
 wyL4TLH+aEczHGmGSGCaa8KJtd5EzlU6frbfOy6byR1SCqs7QvZLbcHnkLMTSZSMQFgmLWCRE
 TcDv4m6mariOCy0XLfy+WmWnW4nMlRIgcZMdW7U8wu7NEPKizogvZO/FZvkJJIA6TV1M7qmA/
 Mrmte1Ar2281/UhcKWtAcftFX8g3bAq+ouScIJOmGBjpGkg7nUhSfjUOCm9zp5Su3mic=
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi José,

> I can confirm both that the bug is present and that your patch fixes it.
Thanks for your testing and feedback!
And kudos for implementing the feature in the first place.


Regards
Claudia

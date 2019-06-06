Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65DC73811C
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2019 00:43:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbfFFWnS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Jun 2019 18:43:18 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:45105 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726427AbfFFWnR (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Jun 2019 18:43:17 -0400
Received: from orion.localdomain ([77.9.2.22]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M7auJ-1hTEDO2ilR-0083yd; Fri, 07 Jun 2019 00:43:15 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org
Subject: repost: input: keyboard: gpio-keys-polled: use input name from pdata
Date:   Fri,  7 Jun 2019 00:43:08 +0200
Message-Id: <1559860989-7723-1-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
X-Provags-ID: V03:K1:bOAsaNr8tQHlMDKCgYQgXdTKjKTSnRtmmn1JGpl1sYaM/yBnuLp
 ShqwLYVCwfXkKSp9r8aG/XZ+1Ckzcrowm2Ce1LTcwBI3lLbSSq9gNcYcGUTsL9uY0rsnXvn
 9BCYkTABtE1Q4KgqG6HeNG9uRBDi5j/NmrxYmfR2Y5/MHPnfwt1MFF86kE1xuGSEZLdYDFT
 irEyiNZgbJOV5GaJwerdw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:IS+pMtHl89I=:H7Nshy3D3si8udDhmsOsrV
 3yhYALvuHOtww9+31gK2g4VvAHZ8wT+JQvDWyDNKAhsOiw0RweV1XfJdXADUF8V7EasnKQ+ZY
 55/FZQ/N9ISc71tE0OrC+Z+ZeB45xbmB76xeZTicrCMOuHOK/NrfK2jkpgItZeUPRo0mAcBsD
 oVW0FbiBjus8/d9NaFOUkNxpEr9Z1vW99FIsM7mSXXmTh/W0evxDPXTaSehqtcg1+I6MbPoXZ
 GtHcK1LCydM1q11VdA8XhFB0bAZj1r5Zn2aYCr1JIWkLDja60b0OuO2tawPnKw26jHt192ofe
 G98hFlul0GFTYLoevcIBkODCdueenMpjZzvMKsV4k6CA4s5k1ZOu8OS9mAnXpiUFUTL8pepIA
 cAgKquRYxujLR9PSG19Rbvg9BZ/ibHooufA+CxFTEhxQCGH90yThv9CEteSACUUr1AHCRXn8+
 jHwiQBQJfjEFoRybI+jAj6FljRNWU5QgKVWL+Y/rdlxul8gd24VQlaQ8VXrs8H9+JSfZZBERe
 gpfn5rX/wLreJQfJEXF2LmMRGS7yNFfDpNjYecY/DHHchtNsDx+hDJtMSMemsG4gPi+zJnj+F
 GiUgL5BV3aufBHyoi521sxQ8REEFE+cHuu7ku/syDL1LMOqBsaTaH3b+ptSY3wIcuRXHCnv8V
 Yj7UypivkPMV2T76+ZiXgYPkLeut+McTBVfiyh2R29FAJSbBLNrSOY2U83IR/qjIist6aMdkY
 rQJhs9JbfC/T8HFlWceMvRh900uL0yPWG55yhTsYd6cuTXvXbnKMR+GzXws=
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

this patch had already been sent a while ago, and a discussion arised
about whether pdata support should be dropped in favour of of/acpi.

Unfortunately, the open problems - lack of proper of/acpi data and sane
ways to inject this data - remain (theoretically, could be done by writing
special fwnode backends, but that would be a whole project on its own)
and the discussion perished w/o any conclusion.

Until we have a complete and easily replacement for pdata, even for cases
where no oftree/acpi data is available and platform drivers need to be
instantiated directly, pdata structs still need to be maintained.

Therefore I'm resending this pretty trivial patch.


--mtx

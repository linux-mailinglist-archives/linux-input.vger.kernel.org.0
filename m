Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D707F717A40
	for <lists+linux-input@lfdr.de>; Wed, 31 May 2023 10:37:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230201AbjEaIho (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 31 May 2023 04:37:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232512AbjEaIhn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 31 May 2023 04:37:43 -0400
X-Greylist: delayed 854 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 31 May 2023 01:37:39 PDT
Received: from mail.ettrick.pl (mail.ettrick.pl [141.94.21.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 929B410B
        for <linux-input@vger.kernel.org>; Wed, 31 May 2023 01:37:39 -0700 (PDT)
Received: by mail.ettrick.pl (Postfix, from userid 1002)
        id EE640AA9FC; Wed, 31 May 2023 08:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ettrick.pl; s=mail;
        t=1685520965; bh=ZOVeXw1jXE9TbyZP9aLdRwM96AORcRfum8b+rry5JMw=;
        h=Date:From:To:Subject:From;
        b=VeLwJpPFCIMnuNfIy+saUODt5xj/raPm6C/ClLQZ13ksMx624CDgdWIlS+s+I/jjc
         hG4m3JGbr1xhg6/XZeD9kBH3KyR9zirhnZ3NaGMXMYlg0s/bV6+CoWMbGxvfc289mL
         OTjAOJdi7dfylk2e+C9g3j8D9mls3LrQc8d6WNX9Zxt/Sc7wmblVItUgyN8/leFvaU
         kVR9aSWsqI3jmi5CxmFbBQ5WYJ2fQ0EyrMeM5JyR9XoJ9hzi8BopqTqjbmDudlbkA3
         sPBEZA8Hh2nIFILYK937wM+XX2GTUFVObfGhgknn6n2QYrDiozb3KwB811lCKkOIis
         mZAeUjOz1nYzQ==
Received: by mail.ettrick.pl for <linux-input@vger.kernel.org>; Wed, 31 May 2023 08:15:40 GMT
Message-ID: <20230531064500-0.1.ax.4blvm.0.e9ohsprps2@ettrick.pl>
Date:   Wed, 31 May 2023 08:15:40 GMT
From:   "Norbert Karecki" <norbert.karecki@ettrick.pl>
To:     <linux-input@vger.kernel.org>
Subject: Fotowoltaika- propozycja instalacji
X-Mailer: mail.ettrick.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_ABUSE_SURBL,URIBL_BLOCKED,
        URIBL_CSS_A,URIBL_DBL_SPAM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: *  0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was
        *      blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [URIs: ettrick.pl]
        *  1.2 URIBL_ABUSE_SURBL Contains an URL listed in the ABUSE SURBL
        *      blocklist
        *      [URIs: ettrick.pl]
        *  2.5 URIBL_DBL_SPAM Contains a spam URL listed in the Spamhaus DBL
        *      blocklist
        *      [URIs: ettrick.pl]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        *      [141.94.21.111 listed in zen.spamhaus.org]
        *  0.1 URIBL_CSS_A Contains URL's A record listed in the Spamhaus CSS
        *      blocklist
        *      [URIs: ettrick.pl]
        * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
        *      [score: 0.0000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dzie=C5=84 dobry,
=20
Czy rozwa=C5=BCali Pa=C5=84stwo monta=C5=BC systemu fotowoltaicznego?
=20
Instalacja fotowoltaiczna jest najlepszym sposobem na obni=C5=BCenie wyso=
ko=C5=9Bci rachunk=C3=B3w za pr=C4=85d (pozostaj=C4=85 tylko op=C5=82aty =
sta=C5=82e) i zabezpieczenie si=C4=99 przed rosn=C4=85cymi cenami energii=
 elektrycznej. Jest to w pe=C5=82ni odnawialne i bezemisyjne =C5=BAr=C3=B3=
d=C5=82o energii, dzi=C4=99ki czemu przyczyniamy si=C4=99 do ochrony =C5=9B=
rodowiska naturalnego.
=20
Dzia=C5=82amy od wielu lat na rynku energetycznym. Przygotujemy projekt, =
wycen=C4=99 oraz kompleksowo wykonamy i zg=C5=82osimy realizacj=C4=99 do =
zak=C5=82adu energetycznego.=20
=20
Czy chc=C4=85 Pa=C5=84stwo pozna=C4=87 nasz=C4=85 propozycj=C4=99? =20


Pozdrawiam,
Norbert Karecki

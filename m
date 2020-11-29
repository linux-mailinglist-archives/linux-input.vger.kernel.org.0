Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FA432CE1CA
	for <lists+linux-input@lfdr.de>; Thu,  3 Dec 2020 23:35:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731887AbgLCWeJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Dec 2020 17:34:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731883AbgLCWeJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 3 Dec 2020 17:34:09 -0500
Received: from mail.archlinux.org (mail.archlinux.org [IPv6:2a01:4f9:c010:3052::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC5BFC094251
        for <linux-input@vger.kernel.org>; Thu,  3 Dec 2020 14:32:58 -0800 (PST)
Received: from [IPv6:2001:8a0:f24a:e00:b36f:9f92:bb23:71bb] (unknown [IPv6:2001:8a0:f24a:e00:b36f:9f92:bb23:71bb])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ffy00)
        by mail.archlinux.org (Postfix) with ESMTPSA id 209782836F1;
        Thu,  3 Dec 2020 22:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=archlinux.org;
        s=dkim-rsa; t=1607034775;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=X86GOQ8hL9yxgvuz2lk0iBd0nejnwE5ojE6Tb//gFts=;
        b=qZsbDCJTljD/yLb5HhtPN1nK+ohIwuwhG5y8Vl/w5l1Hn1k6G0w1woUyUt+jvRg56PBR5V
        Sj3hi5Ye3wlHESohznUor6nWW7p0uE9ohqxyoQ46hAiV2XzokL3KoU7SVnsEghG6tEWw1u
        EjMI0r+eoMlNOjVr0p3Lm2J/R85Zq+f2ZLDPZ74Z7JZJjexEHN+YIDzblheZsq8y5FR9JA
        BURoKpNf3cMJ9eJNMJDO3gsc8P4oDkZ9vvePbR+K4e2TePbyZAMcjoKPal2HTkrP6zP+3A
        PNxQhCDjlGERV/I5Ub54bkOHrVblFPm9/okzR7b/5EHG14TmLfzubfhwlDMNwSCvBqyx5D
        RQqrtxhjZDGRqtI86zmhTexuihB4nzB27/MrJzys27IcbbHaXKSNqWUJDQluIskgUiqDOJ
        KhzVMTaYTxl0BPgMY+0iUSI7hqk1jgixzGXLmOJyXEy+ZoZ+Yu/edxuslNnNBQj43BgPns
        Mi5WJ2233MOY/1R3ZYCBCwxF56TXo177HVxlvJp62Wy1H8rqPYkDTf5VUNHNjEcit2oSSh
        CWh5Y1eDtDAmSDWDTtT+melWWJpnKagciO/6Ljg5fwQKY/PRAmaC6mwMVwjlcl7M81Dov3
        o4eWDnI27vytP43BKS53jx9SdXuJ9wFmQIXdGhnm4oAE0G4tt7Qbg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=archlinux.org;
        s=dkim-ed25519; t=1607034775;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=X86GOQ8hL9yxgvuz2lk0iBd0nejnwE5ojE6Tb//gFts=;
        b=u8zT3+NiXfFjBswz3BqZBAZgfWE5hTQz8MIkWmmLbOBidtwqPw1mjAqkuzkUXBiS6x+h+Q
        RIiA5waCIID1EJAQ==
Message-ID: <59ee9ef054b18aac75eec1276aa83cf4a8f076ca.camel@archlinux.org>
Subject: Re: [V3, PATCH] Add additional hidraw input/output report ioctls.
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     Dean Camera <dean@fourwalledcubicle.com>,
        linux-input@vger.kernel.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com
In-Reply-To: <c55b4ad5-9fb8-18ef-b931-38a4c37f445f@fourwalledcubicle.com>
References: <20201125223957.5921-1-dean@fourwalledcubicle.com>
         <2e19588821053914eebe30088b4590af51959409.camel@archlinux.org>
         <2c2bfd55-3a03-9839-22f5-16058ac24e35@fourwalledcubicle.com>
         <c8d4d17798e2c9fca417223d4edf5f4b1aebf75d.camel@archlinux.org>
         <d295d0bf-9de7-9927-05b6-2897ada89c42@fourwalledcubicle.com>
         <877bfbede4d3bbf40a91c8392218eeab6672e98c.camel@archlinux.org>
         <c55b4ad5-9fb8-18ef-b931-38a4c37f445f@fourwalledcubicle.com>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-8dqWbW59nm7+kzheyoad"
Date:   Sun, 29 Nov 2020 20:01:30 +0000
MIME-Version: 1.0
User-Agent: Evolution 3.38.2 
Authentication-Results: mail.archlinux.org;
        auth=pass smtp.auth=ffy00 smtp.mailfrom=lains@archlinux.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-8dqWbW59nm7+kzheyoad
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2020-11-28 at 18:02 +1100, Dean Camera wrote:
> On 28/11/2020 7:11 am, Filipe La=C3=ADns wrote:
> > On Fri, 2020-11-27 at 15:05 +1100, Dean Camera wrote:
> > > Thank you for the review, Filipe!
> > >=20
> > > I'm still new to the kernel patch submission process, so I'm a little
> > > perplexed by the next steps. Who will decide if it is to be applied, =
and
> > > is there any further action I need to take?
> >=20
> > No worries :)
> > That'd probably Benjamin Tissoires, co-maintainer of the HID subsystem.
> > There is no further action you need to take, just wait. Please understa=
nd
> > that
> > these things can sometimes take a while as maintainer time is limited a=
nd
> > they
> > may have a long backlog to fight through.
> >=20
>=20
> I completely understand - I maintain some open source projects myself,=
=20
> so I know how it is. I'm just a millenial used to pull requests, issue=
=20
> trackers and/or email attachments, so I wasn't too sure how to proceed=
=20
> here and didn't want to mis-step and end up with it getting lost due to=
=20
> my own inaction.

Me too :P
It can be a bit difficult to get started.

> Thank you both sincerely for your time and efforts, they are very much=
=20
> appreciated.
>=20
> > Also be aware that maintainers might be a bit conservative about adding=
 new
> > features as they will be required to maintain them in the long run, so =
don't
> > take it personally if they chose not to to merge some of your patches.
> >=20
> > > I am obviously keen, but not impatient, to get this feature in. I'm
> > > happy to follow whatever process is required, I just haven't found
> > > anything beyond the initial "submitting your patch" documentation.
> >=20
> > Yeah, I sympathize. The process essentially is to send the patch and wa=
it :P
> >=20
>=20
> I do wish there was a way to track the patches a little better - I fully=
=20
> understand about the time pressures involved, but having a way to at=20
> least know it was seen and added to a backlog somewhere would be nice.=
=20
> Alas, I fear such talk is somewhat like the proverbial ocean boiling.

There is
https://patchwork.kernel.org/project/linux-input/patch/20201125223957.5921-=
1-dean@fourwalledcubicle.com/

> Just one thing, in the kernel mailing lists you are discouraged to top-po=
st.

Thanks for the advice, taken under consideration :).

>=20
> A: Because it messes up the order in which people normally read text.
> Q: Why is top-posting such a bad thing?
>=20
> A: Top-posting.
> Q: What is the most annoying thing in e-mail?
>=20
> A: No.
> Q: Should I include quotations after my reply?
>=20
> > Cheers!
> > - Dean
>=20
> Cheers,
> Filipe La=C3=ADns
>=20

Cheers!
- Dean

Cheers,
Filipe La=C3=ADns

--=-8dqWbW59nm7+kzheyoad
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAl/D/hMACgkQ+JPGdIFq
qV2+HQ//d30/taE4KrGrKlwIveixM1+0SlsSKZu+hJ6tvHneg13osEte4vzRkLpS
mxMMoywhFpGLYVd4ZSWcoudyfto1W60RUUYP2E4xswKiX5+x5KB6MY1TnfSXSwH0
3ateNY1f2RmUAjWf15cu+BmnfbGiO2KtUZEVrk5g9fef8Dw4mVkC4MytiuMSLcRa
ZP74Rx3nIleA4g0ZoE6KL+F7BvXQOwLx/Lvx7EDyWiwltd1XX7aodyObX8ZNy50d
gS2GZEIKTS+PAGntjHoyJ6+oKvYeJoi+WDBt/kln1Eo1GrDWWWrAaIGG1t0mM3OI
/UBXrVD9FNSFZtD9XYQyZrYn/cE5Jy7EJ7flvMUoFAUYaMUTsaCZ1mW7dRzOOyjy
DOnacyarBMNSxt8EpgBqxsfiA/Ab9vs7z3ioLJZkpKckozChM40sKk1zOHcMBEDz
eTvhaIt9GbchJuQoMo/iO4+N24KkeqSIq09V/WohKy3cSURtcJvJ3oPJ32p0tXkS
CAXVs7TaYX37v09h0MiUe6Z5UZC8YaztvOuZgsGXFxPEbTJLMPGohXUrPX0/ykoG
rpqMEoRjE1TLNkYaU3PGA2L0YGANgoIZM+evViLn51vDTVrIa2TejVhCTA+N8KiJ
7xKhOjyWiJHEsus9UcO3SwNmfgHuEbpl1HfJB0bim4ch+IaZQek=
=awaH
-----END PGP SIGNATURE-----

--=-8dqWbW59nm7+kzheyoad--

